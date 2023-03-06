class UserAddress < ApplicationRecord
  belongs_to :user
  validates :name, :address, :main, presence: true
end
