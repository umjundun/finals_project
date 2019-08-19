class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :edit]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      redirect_to organizations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @organization.update(organization_params)
      redirect_to root_path(@organization)
    else
      render :edit
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :mission)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
