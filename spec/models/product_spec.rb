require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it {should belongs_to(:categories)}
    it {should belongs_to(:discounts)}
    it {should have_many(:order_products)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:active)}
  end
end