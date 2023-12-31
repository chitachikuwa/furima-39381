class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
  
  has_many :items 
  has_many :purchases      

  validates :nickname, :birth, presence: true
  validates :password, presence: true, length: {minimum: 6}, format: {with:  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :kane_last_name, presence: true, format: {with: /\A[ァ-ヶー]+\z/ }
  validates :kana_first_name, presence: true, format: {with: /\A[ァ-ヶー]+\z/ }
end
