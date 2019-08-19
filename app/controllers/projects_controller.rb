class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit]
  before_action :set_organization, only: [:show, :update, :edit]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.organization = set_organization
    if @project.save
      redirect_to project_path(@project)
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

  def set_organization
    @organization = Organization.find(@project.organization.id)
  end
end
