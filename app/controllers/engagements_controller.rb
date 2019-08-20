class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:show, :update, :edit]
  before_action :set_user
  before_action :set_project

  def index
    @engagements = policy_scope(Engagement).order(created_at: :desc)
  end

  def show
    authorize @engagement
  end

  def new
    @engagement = current_user.engagements.new
    authorize @engagement
  end

  def create
    @engagement = current_user.engagements.new(engagement_params)
    @engagement.project = @project
    @engagement.user = current_user
    @engagement.status = "Pending"
    if @engagement.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @engagement.authorize
    if @engagement.update(engagement_params)
      redirect_to project_path(@engagement)
    else
      render :edit
    end
  end

  private

  def engagement_params
    params.require(:engagement).permit(:status)
  end

  def set_engagement
    @engagement = Engagement.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
