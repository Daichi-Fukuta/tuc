class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_one_attached :avatar
  belongs_to :gender
  has_many :items, dependent: :destroy
  has_many :comments
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> {where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> {where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  validates :nick_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_phonetic, presence: true
  validates :last_name_phonetic, presence: true
  validates :birthday, presence: true
  validates :phone, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end

