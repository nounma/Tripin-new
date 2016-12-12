class Answer < ApplicationRecord

  COMPLETED = "completed"
  PENDING = "pending"
  NOT_COMPLETED = "not_completed"

  belongs_to :team
  # belongs_to :challenge
  belongs_to :team_challenge
  has_one :challenge, through: :team_challenge

  mount_uploader :picture, PhotoUploader



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
