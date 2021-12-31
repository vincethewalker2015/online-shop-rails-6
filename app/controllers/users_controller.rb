class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, except: [:edit, :show]
  
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:notice] = "Log in Details created, Now create your profile"
      redirect_to new_profile_path(@current_user)
    else
      flash[:alert] = "Try Again.."
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @orders = @user.orders.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # flash.now[:success] "Updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
      flash.now[:success] = "User Deleted"
      redirect_to root_path
    end
  end

  

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
