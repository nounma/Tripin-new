class MembersController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @member = Member.new
  end
  
  def create
    @team = Team.find(params[:team_id])
    @user = User.find_by_email(params[:member][:email])
    if @user
      Member.create(user: @user, team: @team)
      flash[:success] = "Member added"
    else
      flash[:error] = "User not found"
    end
    redirect_to team_path(@team)
  end

  def destroy
    if(Member.exists?(params[:id]))
      @member = Member.find(params[:id])
      @team = @member.team
      @member.destroy
    end
    redirect_to team_path(@team)
  end
end
