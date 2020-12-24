class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, :email, :birthday, presence: true
  
  validates :password, presence: true,
            format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6}\z/ }
  
  validates :last_name, :first_name, presence: true,
  format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  validates :last_name_kana, :first_name_kana, presence: true,
  format: { with: /\A[ァ-ヶー－]+\z/ }
end
