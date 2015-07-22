class CitiesController < ApplicationController
  def index
    @cities = City.all
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.valid?
      @city.save
      redirect_to action: "index"
      flash[:success] = "the city #{@city.name} was successfully created."
    else
      @cities = City.all
      render :index
    end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
