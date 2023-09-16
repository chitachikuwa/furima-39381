FactoryBot.define do
  factory :purchase_costomer do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567'}
    shipping_area_id { 2 }
    city {'港区'}
    address {'港4-5'}
    building {''}
    phone_num { '09012345678' }
  end
end
