require 'rails-helper'

RSpec.describe User_payment, type: :model do
  describe 'associations' do
    it {should belongs_to(:user)}
  end

  describe 'validations' do
    it {should validate_presence_of(:card_name)}
    it {should validate_presence_of(:card_number)}
    it {should validate_length_of(:carb_number).is_equal_to(16)}
    it {should validate_presence_of(:card_expiration)}
    it {should validate_length_of(:card_expiration).is_equal_to(4)}
  end
end