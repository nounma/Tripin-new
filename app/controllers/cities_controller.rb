class CitiesController < ApplicationController



  def index
    @cities = policy_scope(City)
  end

  def show

    authorize @cities
  end

  private
  def city_params
    params.require(:city).permit(:name, :picture, :country, :advice, :id )
  end

end
