class Challenge < ApplicationRecord

  belongs_to :city
  has_many :teams, through: :team_challenges
  # has_many :answers
  has_one :answer

end
