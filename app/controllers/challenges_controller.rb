class ChallengesController < ApplicationController
  def index

  @user = User.find(params[:user_id])
  @team = Team.find(team_params[:team_id])

  @team_challenges = @team.challenges

  end

  def show
  end

private
  def find_user
    @user = User.find(params[:id])
  end

 def user_params
    params.require(:user).permit(:id)
  end
def team_params
    params.require(:user).permit(:start_date, :end_date)
  end
end
