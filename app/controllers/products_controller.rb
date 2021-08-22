class ProductsController < ApplicationController
  before_action :require_admin, only: [:new, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # @category_array = params.dig(:product, :category_ids)
      # @category_array.each do |cat|
      #   @category = Category.find(cat)
      #   @product.categories << @category
      # end
      flash[:notice] = "Product added!"
      redirect_to products_path
    else
      flash[:notice] = "Product can't be blank!"
      render 'products/new'
    end
  end

  def show 
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      # @product.product_categories.destroy_all
      # @category_array = params.dig(:product, :category_ids)
      # @category_array.each do |cat|
      #   @category = Category.find(cat)
      #   @product.categories << @category
      # end
      flash[:notice] = "Product updated!"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    Product.destroy(params[:id])
    flash[:notice] = "Product removed!"
    redirect_to products_path
  end

  def search
    if params[:product].present?
      @products = params[:product].present?
      @products = Product.search(params[:product])
      if @products && @products.count > 0
        respond_to do |format|
        format.js { render partial: 'shared/searchresult' }
      end
      else
        respond_to do |format|
          flash.now[:unsucessful] = "Item not found"
          format.js { render partial: 'shared/searchresult' }
          end
        end
      else
        respond_to do |format|
        flash.now[:unsucessful] = "Please enter a Product name or description to search"
        format.js { render partial: 'shared/searchresult' }
      end
    end
  end


  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :picture, category_ids: [])
    end

    def require_admin 
      if !( current_user.admin?)
        flash[:alert] = "You cannot perform this action"
        redirect_to products_path
      end
    end

end
