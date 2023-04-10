require 'rails_helper'

Rspec.describe CategoriesController, type: :controller do
  describe "GET#index" do
    it "assigns all categories to @categories" do
      sign_in(create(:user, :admin))
      category = create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe "GET#show" do
    it "assigns category to @category" do
      sign_in(create(:user, :admin))
      category = create(:category)
      get :show, params: { id: category.id}
      expect(assigns(:category)).to eq(category)
    end
  end

  
end