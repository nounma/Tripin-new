class AddCityId < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :city_id, :string
    remove_column :teams, :city
    add_column :teams, :city_id, :integer

  end
end
