class Costomer < ApplicationRecord
  belongs_to :purchase
  belongs_to :shipping_area
end
