class AddCoverPicColumnsToChallenges < ActiveRecord::Migration[5.0]
 def self.up
    change_table :challenges do |f|
      f.attachment :cover_pic
    end
  end

  def self.down
    remove_attachment :challenges, :cover_pic
  end
end
