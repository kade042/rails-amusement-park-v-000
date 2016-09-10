class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Amusement Park!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "invalide name or password!"
      redirect_to sign_in_path
    end


  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
