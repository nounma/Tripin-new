class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])


      total_score = 0
    @team.challenges.each do |challenge|
      if !challenge.answer.nil?
        if !challenge.answer.status == Answer::PENDING
          if challenge.answer.status == Answer::COMPLETED
          total_score += challenge.score
        end
      end
    end
end
    @total_score = total_score

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

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to team_path(@team)
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to user_path(current_user)
  end

  private

  def team_params
    params.require(:team).permit(:title, :team_picture, :start_date, :end_date, :city, :team_picture_cache, :id )

  end
end
