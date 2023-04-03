class UserPayment < ApplicationRecord
  belongs_to :user
  validates :card_number, length: { is: 19 }, uniqueness: true 
  validates :card_expiration, length: { is: 4 }
  validates :card_name, :card_expiration, :card_number, presence: true
end
