class EngagementsController < ApplicationController
  before_action :set_engagement, only: [:show, :update, :edit]
  before_action :set_project, except: [:show, :index, :edit, :update]
  after_action :create_notifications, only: [:create]

  def index
    if current_user.group == "ngo"
      @engagements = policy_scope(current_user.organization.engagements).order(created_at: :desc)
    else
      @engagements = policy_scope(current_user.engagements).order(created_at: :desc)
    end
  end

  def show
    @project = @engagement.project
    @organization = @project.organization
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
      # ActionCable.server.broadcast "notifications:#{@engagement.project.user_id}", project_name: @engagement.project.title, user: current_user.full_name

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
      # if @engagement.dev_status.include? "Current"
      #   @engagement.start_date = Time.now.to_datetime
      # elsif @engagement.dev_status.include? "Completed"
      #   @engagement.end_date = Time.now.to_datetime
      # end
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def engagement_params
    params.require(:engagement).permit(:status, :request, :dev_status, :ngo_status, :start_date, :end_date)
  end

  def set_engagement
    @engagement = Engagement.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def recipient
    @engagement.project.user
  end

  def create_notifications
    Notification.create(recipient: recipient, actor: current_user, action: 'engagement', notifiable: @engagement)
  end
end
