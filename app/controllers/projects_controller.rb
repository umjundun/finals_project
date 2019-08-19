class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to organization_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
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
end
