class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  private

  def require_admin
    unless current_user.role == "admin"
      flash[:alert] = "You are not allowed visit this page"
      redirect_to root_path
    end
  end
end
