require 'rails_helper'

RSpec.describe User, type: :model do
 before do
  @user = FactoryBot.build(:user)
 end

 describe 'ユーザー新規登録' do
  context '新規登録できる場合' do
    it "nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_name、kana_last_nameとkana_first_nameとbirthが存在すれば登録できる" do
      expect(@user).to be_valid
    end
  end
  context '新規登録できない場合' do
    it "nicknameが空では登録できない"  do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do 
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it  "kane_last_nameが空では登録できない" do
      @user.kane_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kane last name can't be blank")
    end
    it "kana_first_nameが空では登録できない" do 
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it "birthが空では登録できない" do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = '1234j'
      @user.password_confirmation = '1234j'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it  "passwordとpassword_confirmationが不一致では登録できない" do
    @user.password = '123kkk'
    @user.password_confirmation = '123kkkk'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが半角英字のみの場合は登録できない" do
      @user.password = "password"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが数字のみの場合は登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it  "重複したemailが存在する場合は登録できない" do
     @user.save
     another_user = FactoryBot.build(:user, email: @user.email)
     another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
   end
   it "emailは@を含まないと登録できない" do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end
  it "kana_last_nameがカタカナ以外では登録できない" do
   @user.kane_last_name = "山田"
  @user.valid?
  expect(@user.errors.full_messages).to include('Kane last name is invalid')
  end
  it "kana_first_nameがカタカナ以外では登録できない" do
    @user.kana_first_name = "花子"
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana first name is invalid')
  end
  it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
    @user.last_name = "Yamada"  
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid")
  end
   it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
    @user.first_name = "Hanako"  
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end
  end
 end
end
    
    
