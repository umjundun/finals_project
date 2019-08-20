class OrganizationPolicy < ApplicationPolicy
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
    user.admin
  end

  def update?
    representation = Representative.where("user = ? and organization = ?", [user, record])
    representation.primary
  end
end
