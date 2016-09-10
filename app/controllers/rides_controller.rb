class RidesController < ApplicationController
  def create
    @ride = Ride.create(user_id:  params[:ride][:user_id],
      attraction_id: params[:ride][:attraction_id]
    )
    if @ride.take_ride == true
      flash[:success] = "Thanks for riding the #{@ride.attraction.name}!"
      redirect_to user_path(@ride.user)
    else
      flash[:alert] = @ride.take_ride
      redirect_to user_path(@ride.user_id)
    end
  end
end
