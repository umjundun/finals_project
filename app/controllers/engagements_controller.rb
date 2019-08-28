class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:show, :update, :edit]
  before_action :set_project, except: [:show, :index, :edit, :update]

  def index
    if current_user.organization_id != 1
      @engagements = policy_scope(current_user.organization.engagements).order(created_at: :desc)
    else
      @engagements = policy_scope(current_user.engagements).order(created_at: :desc)
    end
  end

  def show
    authorize @engagement
  end

  def new
    @engagement = Engagement.new
    authorize @engagement
  end

  def create
    @engagement = Engagement.new(engagement_params)
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
    @user = current_user
  end

  def update
    authorize @engagement
    if @engagement.update(engagement_params)
      redirect_to user_engagements_path(current_user)
    else
      render :edit
    end
  end

  private

  def engagement_params
    params.require(:engagement).permit(:status, :request)
  end

  def set_engagement
    @engagement = Engagement.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
