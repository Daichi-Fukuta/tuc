class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date
  belongs_to :category
  has_one_attached :image
  attribute :new_image
  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true,
    numericality: {
      only_integer: true, 
      greater_than: 1
    }
  validates :description, presence: true, length: { maximum: 1000 }

  scope :find_newest_items, -> (p) { page(p).per(4).order(updated_at: :desc) }


  before_save do
  self.image = new_image if new_image
  end
  
end
