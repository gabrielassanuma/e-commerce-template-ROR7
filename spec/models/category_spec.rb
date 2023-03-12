require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it {should belong_to(:product)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:position)}
  end
end
