class AddCityId < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :city, :string

  end
end
