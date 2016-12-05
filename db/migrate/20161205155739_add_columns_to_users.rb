class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :profile_picture, :string
    add_column :users, :total_score, :integer
  end
end
