class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :update, :edit]

  def index
    @applications = application.all
  end

  def show
    @application = application.find(params[:id])
  end

  def new
    @application = application.new
  end

  def create
    @application = application.new(application_params)

     if @application.save
       redirect_to root_path(@application)
    else
      render :new
    end
  end

  def edit
    @application = application.find(params[:id])
  end

  def update
    @application = application.find(params[:id])
    if @application.update(application_params)
      redirect_to project_path(@application)
    else
      render :edit
    end
  end

  private

  def application_params
    params.require(:application).permit(:status)
  end

  def set_application
    @application = application.find(params[:id])
  end
end
