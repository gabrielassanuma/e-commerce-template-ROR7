class Product < ApplicationRecord
  belongs_to :category
  belongs_to :discount, optional: true
  has_many :order_products

  validates :name, :description, :price, :active, presence: true

  has_many_attached :photos
end
