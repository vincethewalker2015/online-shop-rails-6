class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :edit, :update, :destroy]
  def index 
    @categories = Category.all
  end
  
  def new 
    @category = Category.new
  end

  def create 
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category added!"
      redirect_to categories_path
    else
      flash[:alert] = "#{@category.errors.full_messages.pop}"
      render 'categories/new'
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @products = @category.products.all
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def update 
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category updated!"
      redirect_to categories_path
    else
      flash[:alert] = "#{@category.errors.full_messages.pop}"
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category removed!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :picture)
  end

  def require_admin 
    if !( current_user.admin?)
      flash[:alert] = "You cannot perform this action"
      redirect_to products_path
    end
  end
end
