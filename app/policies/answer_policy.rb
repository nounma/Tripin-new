class AnswerPolicy < ApplicationPolicy
  def resolve
    scope
  end

  def create?
    true
  end
  
  def update?
    true
  end
end
