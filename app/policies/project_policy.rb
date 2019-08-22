class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    # representation = Representative.where("user = ?", user) # need to include current org in query
    # representation.primary
    user
  end

  def update?
    record.user == user
  end
end
