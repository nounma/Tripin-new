class CreateTeamChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :team_challenges do |t|
      t.references :challenge, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
