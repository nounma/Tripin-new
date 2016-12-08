class UserPolicy < ApplicationPolicy
  def resolve
    scope
  end
  
  def show?
    true
  end

  def edit?
    update?
  end
  
  def update?
    record == user
  end
end
