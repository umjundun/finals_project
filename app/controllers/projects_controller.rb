class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit]
  before_action :set_organization, only: [:show, :update, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
  end

  def show
    authorize @project
  end

  def new
    @project = Projects.new
    authorize @project
  end

  def create
    @project = Projects.new(project_params)
    @project.organization = set_organization
    authorize @project

    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
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
    authorize @project
  end

  def set_organization
    @organization = Organization.find(@project.organization.id)
  end
end
