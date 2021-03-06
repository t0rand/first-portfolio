class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :unsubscribe, :withdraw, :comeback]
  before_action :ensure_correct_user, only: [:edit, :update, :unsubscribe, :withdraw, :comeback]

  def index
    if current_user.is_admin
      @q = User.with_deleted.ransack(params[:q])
      @users = @q.result(distinct: true)
    else
      render "top"
    end
  end

  def show
    @user = User.with_deleted.find(params[:id])
  end

  def edit
    #@user = User.find_by(id: current_user)
    @user = User.find(params[:id])
  end

  def subscribe
    @user = User.with_deleted.find(params[:id])
  end

  def unsubscribe
    #@user = User.find_by(id: current_user)
    @user = User.find(params[:id])
  end

  def withdraw
    #user = User.find_by(id: current_user)
    user = User.find(params[:id])
    user.destroy
    #@user.update(deleted_at: DateTime.now)
    return true if current_user.is_admin
    reset_session
  end

  def update
    @user = User.find(params[:id])
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

  def comeback
    if current_user.is_admin
      user = User.only_deleted.find_by(id: params[:id])
      user = User.restore(user)
    end
  end

  private

  def ensure_correct_user
    return true if current_user.is_admin
    #binding.pry
    #@user = User.find_by(id: current_user.id)
    @user = User.find(params[:id])
      unless @user == current_user
        redirect_to user_path(current_user)
      end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar, :is_deleted)
  end

end