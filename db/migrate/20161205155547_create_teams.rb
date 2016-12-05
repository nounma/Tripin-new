class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :title
      t.string :team_picture
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
