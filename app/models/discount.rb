class Discount < ApplicationRecord
  has_many :products

  validates :name, :discount, presence: true
end
