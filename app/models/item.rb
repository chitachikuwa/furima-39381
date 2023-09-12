class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one :purchase


  has_one_attached :image
  
  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 0 }
  validates :condition_id,numericality: { other_than: 0 }
  validates :shipping_fee_id, numericality: { other_than: 0 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :shipping_day_id, numericality: { other_than: 0 }
  validates :price,  presence: true,
                     numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
                     

                                
end
