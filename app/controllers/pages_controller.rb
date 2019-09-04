class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    unless params[:query]
      @projects = Project.all

      @devs = User.where("developer = true")

      @organizations = Organization.all
      @markers = @organizations.map do |organization| {
        lat: organization.latitude,
        lng: organization.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { organization: organization }),
        image_url: organization.logo
      }
      end
    else
      search
      @markers = @results_organizations.map do |organization| {
        lat: organization.searchable.latitude,
        lng: organization.searchable.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { organization: organization.searchable }),
        image_url: organization.searchable.logo
        }
      end
    end

  end

  def search
    PgSearch::Multisearch.rebuild(Organization)
    PgSearch::Multisearch.rebuild(Project)
    @results = PgSearch.multisearch(params[:query])
    @results_projects = @results.select {|result| result.searchable_type == "Project"}
    @results_organizations = @results.select {|result| result.searchable_type == "Organization"}

  end
end
