class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]

  def index
    @users = policy_scope(User).order(created_at: :asc)
  end

  def show
    authorize @user
    @organization = Organization.where("name = ?", @user.organization.name)

  end

  def projects
    if current_user.group == "developer"
      @projects = @user.projects
    elsif current_user.group == "ngo"
      @my_projects = @user.organization.projects
    else
      @my_projects = Project.all
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.update(user_params)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
