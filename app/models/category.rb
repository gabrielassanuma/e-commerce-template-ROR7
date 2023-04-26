class Category < ApplicationRecord
  has_many :products

  validates :name, :position, presence: true

  def deactive!
    update(active: false)
  end
end
