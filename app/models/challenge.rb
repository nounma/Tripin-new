class Challenge < ApplicationRecord

  INPUT_TYPE = %w(picture text both)

  belongs_to :city
  has_many :teams, through: :team_challenges
  has_many :answers

  validates :input_type, presence: true, inclusion: { in: INPUT_TYPE }
  validates :good_answer, presence: true
end
