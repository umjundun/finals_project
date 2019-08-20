class EngagementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    @user.developer?
  end

  def index?
    true
  end

  def create?
    user.developer
  end

  def update?
    representation = Representative.where("user = ? and organization = ?", [user, record.project.organization])
    representation.primary
  end
end
