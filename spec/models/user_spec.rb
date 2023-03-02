require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations ' do
    it {should have_many(:orders)}
    it {should have_many(:user_payments)}
    it {should have_many(:user_addresses)}
  end

  describe 'validations' do 
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_length_of(:phone_number).is_equal_to(9)}
  end
end
