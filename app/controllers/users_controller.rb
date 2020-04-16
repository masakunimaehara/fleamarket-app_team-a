class UsersController < ApplicationController
  def show
    if user_signed_in? && current_user.id == params[:id].to_i
      notices = [
                    {text:"事務局からのメッセージ　新型コロナウイルスに伴うマスクの転売を禁止します。発覚した場合は死刑に処します",
                    time: "10時間前"
                    },
                    {text:"事務局からのメッセージ　東出さんが浮気しました",
                    time: "9時間前"
                    },
                    {text:"事務局からのメッセージ　このフォームはeach doで実装しています",
                    time: "8時間前"
                    },
                    {text:"事務局からのメッセージ　データーは仮置きです",
                    time: "7時間前"
                    },
                    {text:"事務局からのメッセージ　このフォームはeach doで実装しています",
                    time: "6時間前"
                    },
                    {text:"事務局からのメッセージ　仮置きのデーターは、usersコントローラーのshowアクションに記載しています",
                    time: "5時間前"
                    },
                    {text:"事務局からのメッセージ　仮置きのデーターは、usersコントローラーのshowアクションに記載しています",
                    time: "4時間前"
                    },
                    {text:"事務局からのメッセージ　仮置きのデーターは、usersコントローラーのshowアクションに記載しています",
                    time: "3時間前"
                    }, 
                    {text:"事務局からのメッセージ　仮置きのデーターは、usersコントローラーのshowアクションに記載しています",
                    time: "2時間前"
                    },           
                    {text:"事務局からのメッセージ　仮置きのデーターは、usersコントローラーのshowアクションに記載しています",
                    time: "1時間前"
                    }
                  ]
      @notices = notices.reverse
                  
      todos = [
                    {text:"フロントページを実装してください",
                    time: "10時間前"
                    },
                    {text:"サーバーサイドを実装してください",
                    time: "9時間前"
                    },
                    {text:"jqueryを導入してください",
                    time: "8時間前"
                    },
                    {text:"hamlを導入してください",
                    time: "7時間前"
                    },
                    {text:"hamlを導入してください",
                    time: "6時間前"
                    },
                    {text:"hamlを導入してください",
                    time: "5時間前"
                    }
                  ]
      @todos = todos.reverse
      @saling_item_quantity = Item.where(seller_id: params[:id]).where(buyer_id: nil).where(auction_id: nil).length

    else
      redirect_to root_path
      flash[:alert] = "異なるユーザーのマイページです"
    end

  end

    def sale_saling_items
      @sale_items = Item.where(seller_id: current_user.id).where(buyer_id:nil).last(15)
      @soldout_items = Item.where(seller_id: current_user.id).where.not(buyer_id:nil).last(15)
    end

    def sale_soldout_items
      @sale_items = Item.where(seller_id: current_user.id).where(buyer_id:nil).last(15)
      @soldout_items = Item.where(seller_id: current_user.id).where.not(buyer_id:nil).last(15)
    end

    def sale_all_saling_items
      @title_kind = 1
      @all_sale_items = Item.where(seller_id: current_user.id).where(buyer_id:nil)
    end

    def sale_all_soldout_items
      @title_kind = 2
      @all_soldout_items = Item.where(seller_id: current_user.id).where.not(buyer_id:nil)
    end
end
