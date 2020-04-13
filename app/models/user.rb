class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/

  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーコメントアウトした　うえやま

  # validates :self_introduction, length: { maximum: 1000 }
  # validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  # validates :password, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  # validates :phone_number, presence: true, uniqueness: true, length: { maximum: 11 }
  # validates :first_name, format: { with: VALID_NAME_REGEX }
  # validates :family_name, format: { with: VALID_NAME_REGEX }
  # validates :first_name_reading, format: { with: VALID_KATAKANA_REGEX }
  # validates :family_name_reading, format: { with: VALID_KATAKANA_REGEX }

  # has_many :evaluations
  # has_many :goods
  has_many :saling_items, -> { where("seller_id is not NULL && buyer_id is NULL") }, class_name: "Item"
  has_many :auction_items, -> { where("seller_id is not NULL && auction_id is not NULL && buyer_id is NULL") }, class_name: "Item"
  has_many :sold_items, -> { where("seller_id is not NULL && buyer_id is not NULL && auction_id is NULL") }, class_name: "Item"
  

  # has_many :comments, dependent: :destroy
  # has_many :payments, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  # has_many :evaluation_notices,dependent: :destroy
  # has_many :good_notices,dependent: :destroy
  # has_many :comment_notices,dependent: :destroy
  # has_many :buyed_item_notices,dependent: :destroy
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー追記した
  validates :self_introduction, length: { maximum: 1000 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  # validates :phone_number, uniqueness: true, length: { maximum: 11 }
    validates :phone_number, length: { maximum: 11 }

 

  has_many :evaluations
  has_many :goods
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :evaluation_notices,dependent: :destroy
  has_many :good_notices,dependent: :destroy
  has_many :comment_notices,dependent: :destroy
  has_many :buyed_item_notices,dependent: :destroy

end
