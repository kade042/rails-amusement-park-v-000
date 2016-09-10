class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:show, :destroy]

  def index
  end

  def show
  end
  
  def edit
  end

  def new

  end

  def create
    #binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Amusement Park!"
      redirect_to user_path(@user)
    end

  end

  def update
    @user.update(user_params)
    if @user
      flash[:success] = "Updated successfully!"
      redirect_to user_path
    else
      flash[:alert] = "You can not update..."
      redirect_to root_path
    end

  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end


end
