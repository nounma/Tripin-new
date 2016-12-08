class AddTeamChallengeToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :team_challenge, foreign_key: true
  end
end
