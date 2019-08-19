class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit]
  before_action :set_status_app

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    if @project.save
      redirect_to root_path(@status_app)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to root_path(@project)
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:description)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_status_app
    @status_app = StatusApp.find(params[:status_app_id])
  end
end
