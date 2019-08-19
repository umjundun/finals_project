class StatusAppsController < ApplicationController
  before_action :set_status_app, only: [:show, :update, :edit]
  before_action :set_user
  before_action :set_project

  def index
    @status_apps = StatusApp.all
  end

  def show
  end

  def new
    @status_app = StatusApp.new
  end

  def create
    if @status_app.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @status_app.update(status_app_params)
      redirect_to project_path(@status_app)
    else
      render :edit
    end
  end

  private

  def status_app_params
    params.require(:status_app).permit(:status)
  end

  def set_status_app
    @status_app = StatusApp.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
