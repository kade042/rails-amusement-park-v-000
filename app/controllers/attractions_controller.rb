class AttractionsController < ApplicationController
  before_action :admin_require, only: :edit
  before_action :find_attraction, except: :index
  def index
    @attractions = Attraction.all
  end

  def show
  end

  def create
    @attraction = Attraction.new(attraction_params)
      if @attraction.save
        flash[:success] =  'Attraction was successfully created.'
        redirect_to attraction_path(@attraction)
      else
        flash[:alert] = 'Something is wrong please check your inputs again ...'
        redirect_to new_attraction_path
      end

  end

  def update
    if @attraction.update(attraction_params)
      flash[:success] =  'Attraction was successfully updated.'
      redirect_to attraction_path(@attraction)
    else
      flash[:alert] = 'Something is wrong please check your inputs again ...'
      redirect_to edit_attraction_path
    end

  end

  def destroy
    @attraction.destroy
    flash[:alert] = 'Attraction was successfully destroyed.'
    redirect_to attractions_path

  end


 def edit
 end

private

 def admin_require
   current_user.admin?
 end

 def attraction_params
      params.require(:attraction).permit( :name, :min_height, :tickets, :happiness_rating, :nausea_rating )
    end

 def find_attraction
   @attraction = Attraction.find_by(id: params[:id])
 end
end
