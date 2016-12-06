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
    @team = Team.new(team_params)
    @team.save
    redirect_to user_team_path(@team)
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def team_params
    params.require(:team).permit(:title, :team_picture, :start_date, :end_date, :city, :team_picture_cache )
  end
end
