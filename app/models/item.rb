class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :item_name, :description, presence: true
  validates :category_id, numericality: { other_than: 0 }, presence: true
  validates :condition_id,numericality: { other_than: 0 }, presence: true
  validates :shipping_fee_id, numericality: { other_than: 0 }, presence: true
  validates :shipping_area_id, numericality: { other_than: 0 }, presence: true
  validates :shipping_day_id, numericality: { other_than: 0 }, presence: true
  validates :price,  presence: true,
                     numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
                     format: {with: /\A[0-9]+\z/}

                                
end
