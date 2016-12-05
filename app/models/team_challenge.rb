class TeamChallenge < ApplicationRecord
  belongs_to :challenge
  belongs_to :team
end
