class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :item_name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id,:shipping_day_id,  presence: true
  validates :price,  presence: true,
                     numerisality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
                                   format: {:with: /\A[a-z]+\z/ }
end
