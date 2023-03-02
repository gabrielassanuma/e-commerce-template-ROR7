require 'rails-helper'

RSpec.describe user_address, type: :model do
  describe 'associations' do
    it {should belongs_to(:user)}
  end

  describe 'validations' do 
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:main)}
  end
end