class Item < ApplicationRecord
  belongs_to :user
  
  has_one_attached :image

  validates :item_name, :description, :price, presence: true
end
