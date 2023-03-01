require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations ' do
    it {should have_many(:orders)}
    it {should have_many(:user_payments)}
    it {should have_many(:user_addresses)}
    
  end
end
