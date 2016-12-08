class AddCoverPicColumnsToCities < ActiveRecord::Migration[5.0]
  def self.up
    change_table :cities do |f|
      f.attachment :cover_pic
    end
  end

  def self.down
    remove_attachment :cities, :cover_pic
  end
end
