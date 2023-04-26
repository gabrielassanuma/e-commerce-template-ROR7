require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe '#require_admin' do
    context 'when user is admin' do
      it 'allows the action to proceed' do
        sign_in(create(:user, :admin))
        category = create(:category)
        get :show, params: { id: category.id }
        expect(response).to be_successful
      end
    end

    context 'when user is not admin' do
      it 'redirects to the root path' do
        sign_in(create(:user))
        category = create(:category)
        get :show, params: { id: category.id }
        expect(response).to redirect_to(root_path)
      end

      it 'displays a flash message' do
        sign_in(create(:user))
        category = create(:category)
        get :show, params: { id: category.id }
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end
  end

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

  describe "GET #new" do
    it "assigns a new category to @category" do
      sign_in(create(:user, :admin))
      get :new
      expect(assigns(:category)).to be_a_new(Category)
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

  describe "PUT#update" do
    context "with valid params" do
      it "updates the request product" do
        sign_in(create(:user, :admin))
        category = create(:category)
        put :update, params: { id: category.id, category: {name: "new_name"} }
        category.reload
        expect(category.name).to eq("new_name")
      end

      it "should redirect to the updated product" do
        sign_in(create(:user, :admin))
        category = create(:category)
        put :update, params: { id: category.id, category: {name: "new_name"} }
        expect(response).to redirect_to(Category.last)
      end
    end

    context "with invalid params" do
      it "should redirect to edit template" do
        sign_in(create(:user, :admin))
        category = create(:category)
        put :update, params: { id: category.id, category: attributes_for(:category, :invalid) }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "PUT#deactive" do
    it "should change product.active to false" do
      sign_in(create(:user, :admin))
      category = create(:category)
      expect { patch :deactive, params: { id: category.id } }.to change { category.reload.active }.from(true).to(false)
    end
  end

end