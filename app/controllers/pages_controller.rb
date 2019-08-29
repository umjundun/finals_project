class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @projects = Project.all
    @devs = User.where("developer = true")
  end

  def search
    PgSearch::Multisearch.rebuild(Organization)
    PgSearch::Multisearch.rebuild(Project)
    @results = PgSearch.multisearch(params[:query])
    @results_projects = @results.select {|result| result.searchable_type == "Project"}
    @results_organizations = @results.select {|result| result.searchable_type == "Organization"}

    #  @results_organizations = PgSearch.multisearch(params[:query])
  end
end
