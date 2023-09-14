require 'rails_helper'

RSpec.describe PurchaseCostomer, type: :model do
  before do
     @purchase_costomer = FactoryBot.build(:purchase_costomer)
  end

  describe '商品が購入できるとき' do
    context '新規登録できる場合' do
       it 'postal_codeとshipping_area_id,cityとaddress,phone_numがあれば保存できる' do
        expect(@purchase_costomer).to be_valid
       end
       it 'ビル名は空でも保存できること' do
        @purchase_costomer.building = ''
        expect(@purchase_costomer).to be_valid
       end 
    end

      context '内容に問題がある場合' do
        it '郵便番号が空だと保存できない' do
          @purchase_costomer.postal_code = ''
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号が３桁-４桁以外だと保存できない' do
          @purchase_costomer.postal_code = '1234567'
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Postal code is invalid')
        end
        it '郵便番号が全角だと保存できない' do
          @purchase_costomer.postal_code = 'テスト―テスト'
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Postal code is invalid')
        end  
        it '都道府県が --- だと保存できない' do
          @purchase_costomer.shipping_area_id = 0
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Shipping area must be other than 0')
        end
        it '市区町村が空だと保存できない' do
          @purchase_costomer.city = ''
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空だと保存できない' do
          @purchase_costomer.address = ''
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号が空だと保存できない' do
          @purchase_costomer.phone_num = ''
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Phone num is invalid')
        end
        it '電話番号が９桁以内だと保存できない' do
          @purchase_costomer.phone_num = '090123456'
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Phone num is invalid')
        end
        it '電話番号が12桁以上だと保存できない' do
          @purchase_costomer.phone_num = '090-123-4567'
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Phone num is invalid')
        end
        it '電話番号が全角だと保存できない' do
          @purchase_costomer.phone_num = 'テスト'
          @purchase_costomer.valid?
          expect(@purchase_costomer.errors.full_messages).to include('Phone num is invalid') 
        end   
      end
    end  
end
