class ItemsController < ApplicationController

  before_action :set_item, only: [:show,:edit,:update]

  def index
    @items1 = Item.where(parent_category_id:1).order("id DESC").last(10)
    @items2 = Item.where(parent_category_id:2).order("id DESC").last(10)
    @items3 = Item.where(parent_category_id:8).order("id DESC").last(10)
    @items4 = Item.where(parent_category_id:6).order("id DESC").last(10)
  end

  def set_price
    @item.update(sales_fee: @item.price/10, sales_profit: @item.price - (@item.price/10))
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
      if @item.price
        set_price
      end
      if @item.save
        flash[:notice] = '出品しました'
        redirect_to root_path
      else
        flash[:alert] = '登録できませんでした'
        redirect_to new_item_path
      end
  end

     # 親カテゴリーが選択された後に動くアクション
  def category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find(params[:parent_id]).children # 親カテゴリのidに紐づく子カテゴリを格納
  end
  
   # 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def edit
  end
 
  def update
    if @item.update(item_params)
      if @item.price
        set_price
      end
      flash[:notice] = '登録しました'
      redirect_to root_path
    else
      flash[:alert] = '登録できませんでした'
      redirect_to edit_item_path(@item.id)
    end
  end
 
  def destroy
    @item.destroy
    redirect_to root_path
  end


  def list_from_category
    @categorysNAME = []
    @items = []
    self_ancestory_categoryIDs = Category.find(params[:id]).path_ids # 選択されたカテゴリーの自分と先祖のidを全て取得
    self_ancestory_categoryIDs.each do |categoryID|
    @categorysNAME << Category.find(categoryID).name
    # 選択されたカテゴリーと親のnameを格納
  end
    self_progeny = Category.find(params[:id]).subtree
    # 自己と子供のカテゴリーを格納
    @items = self_progeny.map(&:items)
    # 配列の平坦化
    @items.flatten!
  end

  def show
    @user = User.find(@item.seller_id)
    @images = @item.item_images
    @imagesLENGTH = @images.length 
    @mago = @item.category
    @ko = @item.children_category
    @oya = @item.parent_category
  end

  private
  def item_params
    params.require(:item).permit(:name, :description_item, :brand_id, :category_id, :children_category_id,:parent_category_id,:condition_id, :shipping_charger_id, :shipping_method_id, :ship_from_id, :shipping_days_id, :price, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
