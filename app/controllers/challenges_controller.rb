class ChallengesController < ApplicationController
  def index
    @challenges = policy_scope(Challenge)

    @team = Team.find(params[:team_id])
    authorize @team
    # @users = @team.users

    @team_challenges = @team.team_challenges

    @user = current_user

    @challenges = Challenge.where.not(latitude: nil, longitude: nil)

    list_challenges = []

    @challenges.each do |list|
      list_challenges << [list.latitude, list.longitude, params[:team_id], list.id]
    end

    @coordinates_challenges = list_challenges

   # @hash = Gmaps4rails.build_markers(@list_challenges) do |challenge, marker|
   #    marker.lat challenge.latitude
   #    marker.lng challenge.longitude
   #    #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
   #    end

    #order all the selected challenge by answer.status


    @team_challenges_not_completed = @team_challenges.joins(:answer).where(answers: {status:'not_completed'})
    # @team_challenges_pending = @team_challenges.joins(:answer).where(answers: {status:'pending'})
    @team_challenges_completed = @team_challenges.joins(:answer).where(answers: {status:'completed'})
    @team_challenges_not_answered = @team_challenges - (@team_challenges_not_completed + @team_challenges_completed) #+@team_challenges_pending)
  end

  def show
    @navbardark = true

    @challenge = Challenge.find(params[:id])
    @team = Team.find(params[:team_id])

#    @answer = Answer.where(team_challenge: @team_challenge, team_challenge: @team_challenge).first_or_initialize

    @team_challenge = TeamChallenge.find_by(team: @team, challenge: @challenge)
    @answer = Answer.where(team_challenge: @team_challenge).first_or_initialize

     @hash = Gmaps4rails.build_markers(@challenges) do |challenge, marker|
      marker.lat challenge.latitude
      marker.lng challenge.longitude
      end
    authorize @team

  end
 def edit
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

  def update
    @challenge = Challenge.find(params[:id])
    @team = Team.find(params[:team_id])

    authorize @challenge
    @challenge.update(challenge_params)
    redirect_to team_challenge_path(@team, @challenge)
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

  def challenge_params
    params.require(:challenge).permit(:id, :picture, :picture_cache)
  end

 # def user_params
 #    params.require(:user).permit(:id)
 #  end
# def team_params
#     params.require(:team).permit(:start_date, :end_date)
#   end


end
