
class CardsController < ApplicationController

  require 'payjp'

  before_action :set_card, only: [:show,:pay]
  before_action :card_present,only:[:index,:destroy]
  before_action :take_card,only:[:show,:pay]
  before_action :set_api_key

  
  def index 
    if @card.present?
      set_customer
      set_card_information
    end
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "new"
      # トークンが取得出来てなければループ
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      # params['payjp-token']（response.id）からcustomerを作成
      ) 
      @card = Card.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash[:notice] = '登録しました'
        redirect_to "/"
      else
        flash[:alert] = '登録できませんでした'
        redirect_to action: "new"
      end
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    set_customer
    @customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      flash[:notice2] = '削除しました'
      redirect_to action: "index"
    else #削除に失敗した時にアラートを表示します。
      flash[:alert2] = '削除できませんでした'
      redirect_to action: "index"
    end
  end

  def show 
      if @card.blank?
        #登録された情報がない場合にカード登録画面に移動
        redirect_to cards_path
      else
        #保管した顧客IDでpayjpから情報取得
        set_customer
        #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
        set_card_information
      end
  end

  def pay
    @item.update(buyer_id: current_user.id)
    # 現在のユーザーを購入者に登録
    Payjp::Charge.create(
    :amount => @item.price, 
    :customer => @card.customer_id, 
    :currency => 'jpy', #日本円
   )
    redirect_to item_purchase_index_path(@item.id)
  # 購入確認画面に遷移
  end

  private

  def set_card
    @item = Item.find(params[:id])
  end

  def card_present
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end

  def set_api_key
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
  end


  def set_customer
    @customer = Payjp::Customer.retrieve(@card.customer_id)
  end

  def set_card_information
    @card_information = @customer.cards.retrieve(@card.card_id)
  end

  def take_card
    @card = Card.find_by(user_id: current_user.id)
  end
  
end
