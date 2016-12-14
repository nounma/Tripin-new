class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user

  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :id, :address, :profile_picture)
  end
end
