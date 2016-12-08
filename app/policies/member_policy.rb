class MemberPolicy < ApplicationPolicy
  def resolve
    scope
  end

  def new?
    true
  end
  
  def create?
    true
  end
  
  def destroy?
    true
  end
end
