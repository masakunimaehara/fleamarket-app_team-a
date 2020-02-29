# fleamarket-app_team-a
## usersテーブル
|Column|Type|Options|
|------|----|-------|
<!-- 自己紹介 -->
|name|string|null: false| 
|katakana_name|string|null: false|
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


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
<!-- 出品情報 -->
|item_name|string|null: false|
|description_item|text|null: false|
|item_state|string|null: false|
|price|integer|null: false|
|sales_profit|integer||
<!-- 配送情報 -->
|shipping_charges|string|null: false|
|region|string|null: false|
|shipping_date|datetime|null: false|
|Purchase|text||
### Association
-has_many :goods
-has_many :comments
-belong_to :buyer, class_name: “User”
-belong_to :saler, class_name: “User”
-belong_to :brand, foreign_key: ‘brand_id’
-belong_to :category, foreign_key: ’category_id


## item_imageテーブル
||text||
### Association
-has_many :item_images


## goodテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
-belong_to :user, foreign_key: ‘user_id’
-belong_to :item, foreign_key: ‘item_id’


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|rank|string||
### Association
-belong_to :user
-belong_to :item


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|brand_list|string||
### Association
-belong_to :brand, foreign_key: true


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|caregory_list1|string||
|caregory_list2|string||
|caregory_list3|string||
### Association
-belong_to :brand, foreign_key: true

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
-belong_to :user, foreign_key: ‘user_id’
-belong_to :item, foreign_key: ‘item_id’

## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|
### Association
-belong_to :user
