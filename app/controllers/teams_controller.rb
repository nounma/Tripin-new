class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])

    score_total = 0
    # if challenges.status == "done"
    # score_total + challenge.score
  end

  def new
    @team = Team.new
  end

  def create
    @city = City.find_by_name(params[:team][:city_id])

    @team = Team.new(team_params)
    @team.city_id = @city.id

    @team.save
    
    # create memner from currentuser
    Member.create(user: current_user, team: @team)
    
    redirect_to team_path(@team)
  end
  
  def edit
    @team = Team.find(params[:id])
  end

  def add_member
    @team = Team.find(params[:team_id])
    @user = User.find_by_email(params[:member][:email])
    if @user
      Member.create(user: @user, team: @team)
      flash[:success] = "Member added"
    else
      flash[:error] = "User not found"
    end
    redirect_to user_team_path(current_user, @team)
  end

  def update
    @team = Team.find(params[:id])
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:title, :team_picture, :start_date, :end_date, :city, :team_picture_cache, :id )

  end
end
