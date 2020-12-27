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

end