class Team < ApplicationRecord

  has_many :users, through: :members
  has_many :answers
  has_many :challenges, through: :team_challenges

end
