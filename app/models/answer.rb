class Answer < ApplicationRecord

    ANSWERS_TYPE = %w(completed pending not_completed)

  belongs_to :team
  # belongs_to :challenge
  belongs_to :team_challenge
  has_one :challenge, through: :team_challenge
  validates :status, inclusion: { in: ANSWERS_TYPE }
  # validate :picture_or_text_must_exist

  mount_uploader :picture, PhotoUploader


  COMPLETED = "completed"
  PENDING = "pending"
  NOT_COMPLETED = "not_completed"

  # def picture_or_text_must_exist
  #   if picture.nil? && text.nil?
  #     errors.add(:picture, 'Picture or text must exist')
  #   end
  # end

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
