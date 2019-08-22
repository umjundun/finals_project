class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @projects = Project.all
  end

  def search
    PgSearch::Multisearch.rebuild(Organization)
    PgSearch::Multisearch.rebuild(Project)
    @results = PgSearch.multisearch(params[:query])
  end
end
