require 'rails_helper'

RSpec.describe UserPayment, type: :model do
  describe 'associations' do
    it {should belong_to(:user)}
  end

  describe 'validations' do
    it {should validate_presence_of(:card_name)}
    it {should validate_presence_of(:card_number)}
    it {should validate_length_of(:card_number).is_equal_to(19)}
    it {should validate_presence_of(:card_expiration)}
    it {should validate_length_of(:card_expiration).is_equal_to(4)}
  end
end