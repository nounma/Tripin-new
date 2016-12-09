class AnswersController < ApplicationController
  def show
    authorize @team
  end

  def create
    challenge = Challenge.find(params[:challenge_id])
    team = Team.find(params[:team_id])
    team_challenge = TeamChallenge.find_by(team: team, challenge: challenge)
    answer = Answer.create!(answer_params.merge(team: team, team_challenge: team_challenge))

    ProcessAnswer.new(answer, challenge).process

    authorize team

    redirect_to team_challenges_path(params[:team_id])
  end

  def update
    challenge = Challenge.find(params[:challenge_id])
    team = Team.find(params[:team_id])
    answer = Answer.find(params[:id])

    answer.update(answer_params)

    ProcessAnswer.new(answer, challenge).process
    authorize answer

    redirect_to team_challenges_path(params[:team_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :picture, :picture_cache)

  end

end
