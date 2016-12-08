class ChallengesController < ApplicationController
  def index

    @team = Team.find(params[:team_id])
    # @users = @team.users
    @team_challenges = @team.team_challenges

    @user = current_user

    @challenges = Challenge.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@challenges) do |challenge, marker|
      marker.lat challenge.latitude
      marker.lng challenge.longitude
      #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @team = Team.find(params[:team_id])
    @answer = Answer.where(team_challenge: @team_challenge, team_challenge: @team_challenge).first_or_initialize
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

 # def user_params
 #    params.require(:user).permit(:id)
 #  end
# def team_params
#     params.require(:team).permit(:start_date, :end_date)
#   end


end
