class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_category, only: [:show, :edit, :update, :deactive ]

  def index
    if params[:active] == 'false'
      @categories = Category.all
    else
      @categories = Category.where(active: true)
    end
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :new
    end
  end

  def edit 
  end


  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def deactive
    @category.deactive!
    redirect_to categories_path, notice: 'Product was deactived'
  end

  private

  def require_admin
    unless current_user.role == "admin"
      flash[:alert] = "You are not allowed visit this page"
      redirect_to root_path
    end
  end

  def category_params
    params.require(:category).permit(:name, :position)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
