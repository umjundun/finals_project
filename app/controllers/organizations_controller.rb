class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @organizations = policy_scope(Organization).order(created_at: :desc).geocoded
    @markers = @organizations.map do |organization| {
      lat: organization.latitude,
      lng: organization.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { organization: organization }),
      image_url: organization.logo
    }
    end
  end

  def show
    authorize @organization
    @representatives = Representative.where("organization_id = ?", @organization)
    @projects = Project.where("organization_id = ?", @organization)
  end

  def new
    @organization = Organizations.new
    authorize @organization
  end

  def create
    @organization = Organizations.new(organization_params)
    authorize @organization
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
