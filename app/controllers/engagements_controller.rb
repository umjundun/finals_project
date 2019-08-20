class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:show, :update, :edit]
  before_action :set_user
  before_action :set_project

  def index
    @engagements = Engagement.all
  end

  def show
  end

  def new
    @engagement = Engagement.new
  end

  def create
    @engagement = Engagement.new(engagement_params)
    @engagement.project = @project
    @engagement.user = current_user
    @engagement.status = "Pending"
    if @engagement.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @engagement.update(engagement_params)
      redirect_to project_path(@engagement)
    else
      render :edit
    end
  end

  private

  def engagement_params
    params.require(:engagement).permit(:status, :request)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_user
    @user = current_user
  end
end
