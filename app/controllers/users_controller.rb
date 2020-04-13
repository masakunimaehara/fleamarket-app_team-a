class UsersController < ApplicationController
  def address_new
    @user = User.new
    @user.build_address
  end

  def address_create
    @user = User.new(user_params)
    @user.save
    redirect_to "#"
  end


  def show
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
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :family_name,:first_name_reading,:family_name_reading,:phone_number,address_attributes:[:id, :postal_code, :prefectures, :municipality, :block_number,:building,:user_id])
  end

end
