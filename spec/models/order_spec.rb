require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it {should belong_to(:user)}
  end

  describe 'validations' do
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:total_price)}
  end
end
