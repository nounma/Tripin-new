class AnswersController < ApplicationController
  def show

  end

  def create
    challenge = Challenge.find(params[:challenge_id])
    team = Team.find(params[:team_id])
    answer = Answer.create!(answer_params.merge(team: team, challenge: challenge))

    ProcessAnswer.new(answer, challenge).process

    redirect_to team_challenges_path(params[:team_id])
  end

  def update
    challenge = Challenge.find(params[:challenge_id])
    team = Team.find(params[:team_id])
    answer = Answer.find(params[:id])

    ProcessAnswer.new(answer, challenge).process

    redirect_to team_challenges_path(params[:team_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :picture)
  end

end
