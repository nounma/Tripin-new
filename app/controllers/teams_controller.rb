class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @city = City.find_by_name(params[:team][:city_id])
    
    @team = Team.new(team_params)
    @team.city_id = @city.id
    
    @team.save
    redirect_to user_team_path(current_user, @team)
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def team_params
    params.require(:team).permit(:title, :team_picture, :start_date, :end_date, :city_id, :team_picture_cache )
  end
end
