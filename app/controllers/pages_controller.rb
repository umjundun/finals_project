class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # OBJECTS CREATED TO RENDER FORMS
    @engagement = Engagement.new
    @project = Project.new
    @organization = Organization.new

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
      @markers = @results_projects.map do |project| {
        lat: project.organization.latitude,
        lng: project.organization.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { organization: project.organization }),
        image_url: project.organization.logo
        }
      end
    end

  end

  def search
    PgSearch::Multisearch.rebuild(Organization)
    PgSearch::Multisearch.rebuild(Project)
    @results = PgSearch.multisearch(params[:query])
    @results_projects = @results.select {|result| result.searchable_type == "Project"}
    @results_projects = Project.where(category: Project.find(@results.first.searchable_id).category)
    @results_organizations = @results.select {|result| result.searchable_type == "Organization"}
    # @results_projects = Project.where(category: @results.first.searchable_type)
    # @results_category = @results.select {|result| result.searchable_type == "Category"}
  end
end
