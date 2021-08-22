class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end