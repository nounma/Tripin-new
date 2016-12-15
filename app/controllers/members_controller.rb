class MembersController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @member = Member.new
    authorize @team
  end

  def create
    @team = Team.find(params[:team_id])
    @user = User.find_by_email(params[:member][:email])
    if @user
      Member.create(user: @user, team: @team)
      flash[:success] = "Member added"
    else
      @email = params[:member][:email]
    end
    authorize @team
    respond_to do |format|
      format.js
      format.html {redirect_to team_path(@team)}
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @team = @member.team
    authorize @team
    @member.destroy
    redirect_to team_path(@team)
  end
end
