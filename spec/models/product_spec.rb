require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it {should belong_to(:category)}
    it {should belong_to(:discount)}
    it {should have_many(:order_products)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:active)}
  end
end