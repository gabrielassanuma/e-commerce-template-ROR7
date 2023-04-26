require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
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

  describe "GET#edit" do
    it "assigns the requested category to @category" do
      sign_in(create(:user, :admin))
      category = create(:category)
      get :edit, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "POST#create" do 
    context "with valid params" do
      it "should create new category" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { category: attributes_for(:category) } }.to change(Category, :count).by(1)
      end

      it "should redirects to created category" do
        sign_in(create(:user, :admin))
        post :create, params: { category: attributes_for(:category)}
        expect(response).to redirect_to(Category.last)
      end
    end

    context "with invalid params" do
      it "doesn't create a new category on DB" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { category: attributes_for(:category, :invalid) } }.to_not change(Category, :count)
      end

      it "should redirect to new template" do
        sign_in(create(:user, :admin))
        post :create, params: { category: attributes_for(:category, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

end