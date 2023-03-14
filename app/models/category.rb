class Category < ApplicationRecord
  has_many :products

  validates :name, :position, presence: true
end
