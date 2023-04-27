class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true
  acts_as_list

  def deactive!
    update(active: false)
  end

end
