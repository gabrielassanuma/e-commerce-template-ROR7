require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "associations" do
    it { should have_many(:order_products) }
    it { should have_many(:products) }
  end
end
