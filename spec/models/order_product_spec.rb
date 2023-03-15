require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  
  describe 'associations' do
    it { should belong_to(:order).optional }
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end
  
end
