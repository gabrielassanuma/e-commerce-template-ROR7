require 'rails_helper'
require 'byebug'

RSpec.describe ProductsController, type: :controller do
  describe "GET#index" do
    it "assigns all products to @products" do
      sign_in(create(:user, :admin))
      product = create(:product)
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET#show" do
    it "assigns product to @product" do
      sign_in(create(:user, :admin))
      product = create(:product)
      get :show, params: { id: product.id}
      expect(assigns(:product)).to eq(product)
    end

    it "assigns 4 products with same category to @related_products" do
      sign_in(create(:user, :admin))
      product = create(:product)
      related_products = create_list(:product, 4, category_id: product.category_id)
      get :show, params: { id: product.id }
      expect(assigns(:related_products).count).to eq(4)
    end
  end

  describe "GET#edit" do
    it "assigns the requested product to @product" do
      sign_in(create(:user, :admin))
      product = create(:product)
      get :edit, params: { id: product.id }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST#create" do 
    context "with valid params" do
      it "should create new product" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { product: attributes_for(:product) } }.to change(Product, :count).by(1)
      end

      it "should redirects to created product" do
        sign_in(create(:user, :admin))
        post :create, params: { product: attributes_for(:product)}
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      it "doesn't create a new product on DB" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { product: attributes_for(:product, :invalid) } }.to_not change(Product, :count)
      end

      it "should redirect to new template" do
        sign_in(create(:user, :admin))
        post :create, params: { product: attributes_for(:product, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT#update" do
    context "with valid params" do
      it "updates the request product" do
        sign_in(create(:user, :admin))
        product = create(:product)
        put :update, params: { id: product.id, product: {name: "new_name"} }
        product.reload
        expect(product.name).to eq("new_name")
      end

      it "should redirect to the updated product" do
        sign_in(create(:user, :admin))
        product = create(:product)
        put :update, params: { id: product.id, product: {name: "new_name"} }
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid params" do
      it "should redirect to edit template" do
        sign_in(create(:user, :admin))
        product = create(:product)
        put :update, params: { id: product.id, product: attributes_for(:product, :invalid) }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "PUT#deactive" do
    it "should change product.active to false" do
      sign_in(create(:user, :admin))
      product = create(:product)
      expect { patch :deactive, params: { id: product.id } }.to change { product.reload.active }.from(true).to(false)
    end
  end
end