require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end

  describe '新規商品登録できるとき' do
   context '新規投稿できるとき' do
    it 'imagaとitem_nameとdescription,priceとcategory_idとcondition_id、shipping_fee_idとshipping_area_id、shipping_day_idの情報がないと保存できない' do
     expect(@item).to be_valid
    end
   end
   context '新規投稿できないとき' do
    it 'imageが空では保存できない' do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
    end 
    it 'item_nameが空では登録できない' do
     @item.item_name = ''
     @item.valid?
    expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'descriptionが空では登録できない' do
       @item.description = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが '---' だと登録できない" do
       @item.category_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include('Category must be other than 0')
    end
    it "condition_idが '---' だと登録できない" do
       @item.condition_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include('Condition must be other than 0')
    end
    it "shipping_fee_idが '---' だと登録できない" do
       @item.shipping_fee_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include('Shipping fee must be other than 0')
    end
    it "shipping_area_idが '---' だと登録できない" do
       @item.shipping_area_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include('Shipping area must be other than 0')
    end
    it "shipping_day_idが '---' だと登録できない" do
       @item.shipping_day_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include('Shipping day must be other than 0')
    end    
    it 'priceが空だと登録できない' do
       @item.price = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが299以下だと登録できない' do
       @item.price = 299
       @item.valid?
       expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it "priceが10000000以上だと登録できない" do
       @item.price = 10000000
       @item.valid?
       expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'priceが全角だと登録できない' do
       @item.price = ５５５５
       @item.valid?
       expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
 end  
end
 

