class ChallengesController < ApplicationController
  def index

    @team = Team.find(params[:team_id])
    @user = @team.user
    @team_challenges = @team.challenges

  # @user = User.find(params[:user_id])
  # @team = Team.find(params[:team_id])
  # @team_challenges = @team.challenges

    @challenges = Challenge.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@challenges) do |challenge, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

end

def show
  @challenge = Challenge.find(params[:id])
  @team = Team.find(params[:team_id])
  @answer = Answer.where(challenge: @challenge, team: @team).first_or_initialize
end

private

def find_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:id)
end
 # def user_params
 #    params.require(:user).permit(:id)
 #  end
# def team_params
#     params.require(:team).permit(:start_date, :end_date)
#   end

end
