class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :unsubscribe, :withdraw]
  before_action :ensure_correct_user, only: [:edit, :unsubscribe, :withdraw]

  def index
    @users = User.with_deleted
    #@users = User.only_deleted
  end

  def show
    #@user = User.find_by(id: current_user)
    @user = User.find(param[:id])
  end

  def edit
    #@user = User.find_by(id: current_user)
    @user = User.find(params[:id])
  end

  def unsubscribe
    @user = User.find_by(id: current_user)
    #@user = User.find(params[:id])
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
    user = User.find_by(id: current_user)
    user.destroy
    #@user.update(deleted_at: DateTime.now)
    reset_session
  end

  def comeback
    if current_user.is_admin
      user = User.find_by(id: params[:id])
      user.restore
      #@user.update(deleted_at: DateTime.now)
      redirect_back(fallback_location: root_path) #⇦行動する前に居た画面に戻る。
    end
  end

  private

  # def check_author
  #   @user = User.find(current_user.id)
  #   unless @user.is_admin
  #     redirect_to root_path
  #   end
  # end


  def ensure_correct_user
    return true if current_user.is_admin
    #binding.pry
    @user = User.find_by(id: current_user.id)
      unless @user == current_user
        redirect_to user_path(current_user)
      end
  end

  # def ensure_correct_user
  #   return true if current_user.is_admin
  #   @comment = current_user.post_comments.find_by(id: params[:id])
  #   unless @comment.present?
  #     redirect_to user_path(current_user)
  #   end
  # end

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar, :is_deleted)
  end

end