require 'rails_helper'

RSpec.describe User, type: :model do
 before do
  @user = FactoryBot.build(:user)
end

describe 'ユーザー新規登録' do
  context '新規登録できる場合' do
    it "nicknameとemailとpasswordと"
