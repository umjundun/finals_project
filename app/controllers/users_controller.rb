class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]
  def index
    @users = policy_scope(User).order(created_at: :asc)
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to root_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
