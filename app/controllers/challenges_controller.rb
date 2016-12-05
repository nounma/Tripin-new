class ChallengesController < ApplicationController
  def index

    @user = User.find(params[:user_id])

selectionner les challenges city = city choisie

@team = Team.find(team_params[:team_id])
trip_length = end_date - start_date (model teams)

if trip_length > 3
  num_challenge = 20
else trip_length < 3
  num_challenge = 50
end


  end

  def show
  end

private
  def set_profile
    @user = User.find(params[:id])
  end

 def user_params
    params.require(:user).permit(:id)
  end
def team_params

    params.require(:user).permit(:start_date, :end_date)
  end
