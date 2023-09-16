class PurchaseCostomer
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address,
                :building,:phone_num, :user_id, :item_id, :purchase_id, :token, :price
 
    validates :token, :city, :address, :user_id, :item_id, presence: true
    validates :postal_code, format: {with: /\A\d{3}-\d{4}\z/}
    validates :shipping_area_id, numericality: { other_than: 0 }
    validates :phone_num, format: {with: /\A\d{10,11}\z/}
   

    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Costomer.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city,
                    address: address, building: building, phone_num: phone_num, purchase_id: purchase.id)
    end 
  end

    