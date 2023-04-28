moclass Discount < ApplicationRecord
  has_many :products

  validates :name, :discount, presence: true

  def deactive!
    update(active: false)
  end
end
