class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
  validates :email, presence: true, format: {with: /@/ }
  validates :password, presence: true, length: {minimum: 6}, format: {with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :kane_last_name, :kana_first_name, presence: true, format: {with:  /\A[a-z0-9]+\z/i}
end
