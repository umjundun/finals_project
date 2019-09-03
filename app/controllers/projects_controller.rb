class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :edit]
  before_action :set_organization, only: [:show, :update, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @projects = policy_scope(Project).order(created_at: :desc)
    @engagement = Engagement.new
  end

  def show
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if params[:files].present?
      params[:files].values.each do |file|
        @project.project_files.new(project: @project, name: file[:name], format: (file[:url]).split(//).last(4).join, file_url: file[:url])
      end
    end

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
    params.require(:project).permit(:category, :deadline, :title, :description, :organization_id)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def set_organization
    @organization = Organization.find(@project.organization.id)
  end
end
