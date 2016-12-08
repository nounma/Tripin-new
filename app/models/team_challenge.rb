class TeamChallenge < ApplicationRecord
  belongs_to :challenge
  belongs_to :team

  has_one :answer
end
