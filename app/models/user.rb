class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone_number, length: { is: 9 }, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :first_name, :last_name, presence: true

  has_many :orders
  has_many :user_payments
  has_many :user_addresses
  
  enum role: { admin: "admin", user: "user" }
end
