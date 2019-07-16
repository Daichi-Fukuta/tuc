class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :content, presence: true, length: { maximum: 100 }
end
