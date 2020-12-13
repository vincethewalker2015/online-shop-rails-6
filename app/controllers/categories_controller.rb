class CategoriesController < ApplicationController

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
      flash[:notice] = "Category can't be blank!"
      render 'admin/products/new'
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
    params.require(:category).permit(:name)
  end
end
