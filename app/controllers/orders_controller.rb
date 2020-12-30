class OrdersController < ApplicationController 

  before_action :authorize_admin!

  def index 
    @orders = Order.all
  end
end