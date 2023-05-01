class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_product, only: [:show]

  def index
    @products = Product.page(params[:page]).per(12)
  end

  def admin_products_index
    if params[:active] == 'false'
      @products = Product.all
      session[:show_all_products] = true
    else
      @products = Product.where(active: true)
      session[:show_all_products] = false
    end
  end

  def show
    @related_products = Product.where(category_id: @product.category_id).limit(4)
  end



  private

  def require_admin
    unless current_user.role == "admin"
      flash[:alert] = "You are not allowed visit this page"
      redirect_to root_path
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end


end
