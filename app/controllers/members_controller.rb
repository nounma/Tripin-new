class MembersController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @member = Member.new
  end
end
