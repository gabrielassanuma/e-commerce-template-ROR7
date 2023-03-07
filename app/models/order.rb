class Order < ApplicationRecord
  belongs_to :user
  validates :total_price, :status, presence: true
end
