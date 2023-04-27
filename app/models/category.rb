class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :position, uniqueness: true

  def deactive!
    update(active: false)
  end

  def self.last_position
    Category.order(position: :desc).first&.position || 0
  end
end
