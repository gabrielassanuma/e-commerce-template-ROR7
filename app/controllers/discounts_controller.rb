class DiscountsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_discount, only: [:show, :edit, :update, :deactive ]

  def index
    if params[:active] == 'false'
      @discounts = Discount.all
      session[:show_all_discounts] = true
    else
      @discounts = Discount.where(active: true)
      session[:show_all_discounts] = false
    end
  end

  def show
  end

  def new
    @discount = Discount.new
  end

  def create
    @discount = Discount.new(discount_params)
    if @discount.save
      redirect_to @discount, notice: 'Discount was successfully updated.'
    else
      render :new
    end
  end

  def edit 
  end


  def update
    if @discount.update(discount_params)
      redirect_to @discount, notice: 'Discount was successfully updated.'
    else
      render :edit
    end
  end

  def deactive
    @discount.deactive!
    redirect_to discounts_path, notice: 'Discount was deactived'
  end

  private

  def require_admin
    unless current_user.role == "admin"
      flash[:alert] = "You are not allowed visit this page"
      redirect_to root_path
    end
  end

  def discount_params
    params.require(:discount).permit(:name, :discount)
  end

  def set_discount
    @discount = Discount.find(params[:id])
  end
end
