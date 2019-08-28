class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]

  def index
    @users = policy_scope(User).order(created_at: :asc)
  end

  def show
    authorize @user
    @organization = Organization.where("name = ?", @user.organization.name)
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

  def my_projects
    if @user.group == "developer"
      @user.projects
    elsif @user.group == "ngo"
      @user.organization.projects
    else
      Project.all
    end
  end

  def active_projects
    if @user.group == "ngo"
      @user.organization.projects.where("active = true")
    end
  end

  def my_engagements
    if @user.group == "ngo"
      @user.organization.engagements
    end
  end

  def my_active_engagements
    if @user.group == "ngo"
      my_engagements.where("status = 'accepted'")
    end
  end

  def my_pending_engagements
    if @user.group == "ngo"
      my_engagements.where("status = 'pending'")
    end
  end
end
