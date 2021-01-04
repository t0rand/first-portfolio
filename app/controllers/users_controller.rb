class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:unsubscribe, :withdraw, :edit]
  before_action :check_author, only: [:edit]

  def show
    @user = User.find_by(id: current_user)
  end

  def edit
    @user = User.find_by(id: current_user)
  end

  def unsubscribe
    @user = User.find_by(id: current_user)
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def following
    @user = User.find(params[:id])
    #binding.pry
    @users = @user.following_user
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user
    render 'show_follower'
  end

  def withdraw
    @user = User.find_by(id: current_user)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def check_author
    @user = User.find(current_user.id)
    unless @user.is_admin
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_id)
  end



end