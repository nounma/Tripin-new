class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @navbardark = true

    @team = Team.find(params[:id])
    authorize @team

      total_score = 0
    @team.team_challenges.each do |team_challenge|
      if !team_challenge.answer.nil?
          if team_challenge.answer.status == Answer::COMPLETED
          total_score += team_challenge.challenge.score
      end
    end
  end
    @total_score = total_score
  end

  def new
    @team = Team.new
    authorize @team
  end

  def create
    # raise
    # @city = City.find(params[:city_id])

    @team = Team.new(team_params)
    # @team.city = @city

    @team.save
    Rails.logger.info('save team')
    authorize @team
    Rails.logger.info('authorized team')

    # create memner from currentuser
    Member.create(user: current_user, team: @team)
    Rails.logger.info('created member')

    redirect_to team_path(@team)
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end

  def update
    @team = Team.find(params[:id])
    authorize @team
    @team.update(team_params)
    redirect_to team_path(@team)
  end

  def destroy
    @team = Team.find(params[:id])
    authorize @team
    @team.destroy
    redirect_to user_path(current_user)
  end

  def team_answers
    @team = Team.find(params[:team_id])
    @team_answers = @team.answers
    authorize @team
  end


  private

  def team_params
    params.require(:team).permit(:title, :team_picture, :start_date, :end_date, :city, :team_picture_cache, :id, :city_id )

  end
end
