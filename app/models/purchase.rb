class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :costomer
  belongs_to :shipping_area
end
