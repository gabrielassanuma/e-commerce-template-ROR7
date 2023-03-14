class Product < ApplicationRecord
  belongs_to :category
  belongs_to :discount
  has_many :order_products

  validates :name, :description, :price, :active, presence: true
end
