class TeamPolicy < ApplicationPolicy
  def resolve
    scope
  end

  def index?
    true
  end

  def show?
    record.has_team_member?(user) || user.admin == true
  end

  def new?
    true
  end

  def edit?
    record.has_team_member?(user) || user.admin == true
  end

  def update?
    record.has_team_member?(user) || user.admin == true
  end

  def create?
    true
  end

  def destroy?
    record.has_team_member?(user)
  end

  def team_answers?
    record.has_team_member?(user)
  end
end
