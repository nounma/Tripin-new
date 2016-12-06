class Answer < ApplicationRecord
  belongs_to :team
  belongs_to :challenge

  COMPLETED = "completed"
  PENDING = "pending"
  NOT_COMPLETED = "not_completed"

  def not_completed?
    status == NOT_COMPLETED
  end

  def completed!
    self.status = COMPLETED
    self.save
  end

  def pending!
    self.status = PENDING
    self.save
  end

  def not_completed!
    self.status = NOT_COMPLETED
    self.save
  end
end
