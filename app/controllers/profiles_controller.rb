class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # before_action :require_admin, only: [:index, :edit, :update, :destroy]
  
  def index 
    @profiles = Profile.all
  end
  
  def new 
    @profile = Profile.new
  end

  def create 
    # Ensure that we have the user who is filling out form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    @cart_products_with_qty = current_user.get_cart_products_with_qty
    if @profile.save
      flash[:notice] = "Profile updated!"
      if @cart_products_with_qty.present? 
        redirect_to cart_path
      else 
        redirect_to user_path( params[:user_id] )
      end
    else
      render action: :new
    end
  end
  
  def show
    @profile = Profile.find(params[:user_id])
    @orders = @profile.orders.all if @profile.orders.all
  end

  def edit 
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end

  def update 
    @user = User.find( params[:user_id] )
    @profile = @user.profile
    if @profile.update(profile_params)
        flash[:notice] = "Profile Updated!"
        redirect_to user_path( params[:user_id] )
    else
      render action: :edit
   end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:notice] = "profile removed!"
    redirect_to categories_path
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :email, :phone, :street_address, :city, :postcode, :country)
  end

  def require_admin 
    if !( current_user.admin?)
      flash[:alert] = "You cannot perform this action"
      redirect_to root_path
    end
  end
end
