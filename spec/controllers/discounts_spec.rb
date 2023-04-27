require 'rails_helper'

RSpec.describe DiscountsController, type: :controller do
  describe '#require_admin' do
    context 'when user is admin' do
      it 'allows the action to proceed' do
        sign_in(create(:user, :admin))
        discount = create(:discount)
        get :show, params: { id: discount.id }
        expect(response).to be_successful
      end
    end

    context 'when user is not admin' do
      it 'redirects to the root path' do
        sign_in(create(:user))
        discount = create(:discount)
        get :show, params: { id: discount.id }
        expect(response).to redirect_to(root_path)
      end

      it 'displays a flash message' do
        sign_in(create(:user))
        discount = create(:discount)
        get :show, params: { id: discount.id }
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end
  end

  describe "GET#index" do
    it "assigns all categories to @categories" do
      sign_in(create(:user, :admin))
      discount = create(:discount)
      get :index
      expect(assigns(:discounts)).to eq([discount])
    end
  end

  describe "GET#show" do
    it "assigns category to @category" do
      sign_in(create(:user, :admin))
      discount = create(:discount)
      get :show, params: { id: discount.id}
      expect(assigns(:discount)).to eq(discount)
    end
  end

  describe "GET #new" do
    it "assigns a new category to @category" do
      sign_in(create(:user, :admin))
      get :new
      expect(assigns(:discount)).to be_a_new(Discount)
    end
  end


  describe "GET#edit" do
    it "assigns the requested category to @category" do
      sign_in(create(:user, :admin))
      discount = create(:discount)
      get :edit, params: { id: discount.id }
      expect(assigns(:discount)).to eq(discount)
    end
  end

  describe "POST#create" do 
    context "with valid params" do
      it "should create new category" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { discount: attributes_for(:discount) } }.to change(Discount, :count).by(1)
      end

      it "should redirects to created category" do
        sign_in(create(:user, :admin))
        post :create, params: { discount: attributes_for(:discount)}
        expect(response).to redirect_to(Discount.last)
      end
    end

    context "with invalid params" do
      it "doesn't create a new category on DB" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { discount: attributes_for(:discount, :invalid) } }.to_not change(Discount, :count)
      end

      it "should redirect to new template" do
        sign_in(create(:user, :admin))
        post :create, params: { discount: attributes_for(:discount, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT#update" do
    context "with valid params" do
      it "updates the request product" do
        sign_in(create(:user, :admin))
        discount = create(:discount)
        put :update, params: { id: discount.id, discount: {name: "new_name"} }
        discount.reload
        expect(discount.name).to eq("new_name")
      end

      it "should redirect to the updated product" do
        sign_in(create(:user, :admin))
        discount = create(:discount)
        put :update, params: { id: discount.id, discount: {name: "new_name"} }
        expect(response).to redirect_to(Discount.last)
      end
    end

    context "with invalid params" do
      it "should redirect to edit template" do
        sign_in(create(:user, :admin))
        discount = create(:discount)
        put :update, params: { id: discount.id, discount: attributes_for(:discount, :invalid) }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "PUT#deactive" do
    it "should change product.active to false" do
      sign_in(create(:user, :admin))
      discount = create(:discount)
      expect { patch :deactive, params: { id: discount.id } }.to change { discount.reload.active }.from(true).to(false)
    end
  end

end