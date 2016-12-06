class ChangeColumnToTeams < ActiveRecord::Migration[5.0]
  def change
    remove_column :teams, :end_date
    add_column :teams, :end_date, :datetime
    remove_column :teams, :start_date
    add_column :teams, :start_date, :datetime
  end
end
