# fleamarket-app_team-a
## usersテーブル
|Column|Type|Options|
|------|----|-------|
<!-- 自己紹介 -->
|first_name|string|null: false|
|family_name|string|null: false| 
|katakana_first_name|string|null: false|
|katakana_family_name|string|null: false|
|nickname|string|null: false|
|self_introduction|text||
|email|string|null: false|
|password|string|null: false|
<!-- 生年月日 -->
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
<!-- 住まい住所 -->
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building|string||
<!-- 届け先住所 -->
|dery_postal_code|string|null: false|
|dery_prefectures|string|null: false|
|dery_address|string|null: false|
|dery_building|string||
<!-- 画像 -->
|icon|string||
### Association
-has_many :evaluations
-has_many :goods
-has_many :items
-has_many :comments
-has_many :users_transacts


## users_transactsテーブル 
<!-- <user同士の取引中> -->
|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|transact_buyer_id|integer|foreign_key: true|
|transact_saler_id|integer|foreign_key: true|
|transact_comment|text||
### Association
-belong_to :item






## itemsテーブル
|Column|Type|Options|
|------|----|-------|
<!-- 出品情報 -->
|item_name|string|null: false|
|description_item|text|null: false|
|item_state|string|null: false|
|price|integer|null: false|
|sales_profit|integer||
|category_id|integer||
|brand_id|integer|foreign_key: true|
|buyer_id|integer|foreign_key: true|
|saler_id|integer|foreign_key: true|
<!-- 配送情報 -->
|shipping_charges|string|null: false|
|shipping_date|datetime|null: false|
|shipping_Purchase|text||
|shipping_area|integer|null: false|
### Association
-has_many :items_images
-has_many :goods
-has_many :comments
-belong_to :buyer, class_name: “User”
-belong_to :saler, class_name: “User”
-belong_to :brand 
-belong_to :category
-has_one :evaluation 
-has_one :users_transacts


## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|foreign_key: true|
|file_name|string||
### Association
-belong_to :sayer, class_name: "User"
-belong_to :receiver, class_name: "User"
-belong_to :item 


## goodテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
-belong_to :user 
-belong_to :item


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|rank|string||
### Association
-belong_to :sayer, class_name: "User"
-belong_to :receiver, class_name: "User"
-belong_to :item


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_list|string||
### Association
-has_many :items
-has_many :brand-category


## brand-categoryテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|foreign_key: true|
|category_id|intger|foreign_key: true|
### Association
-belong_to :brand
-belong_to :category


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|caregory_list1|string||
|caregory_list2|string||
|caregory_list3|string||
### Association
-has_many :items
-has_many :brand-category


## to-doテーブル
|Column|Type|Options|
|------|----|-------|
|to-do_list|text||
### Association
-has_many :users


## noticeテーブル
|Column|Type|Options|
|------|----|-------|
|notice_list|text||
### Association
-has_many :users


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_comment|text||
### Association
-belong_to :user
-belong_to :item

## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|
### Association
-belong_to :user
