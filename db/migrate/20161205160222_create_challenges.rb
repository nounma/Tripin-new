class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.string :address
      t.integer :score
      t.string :good_answer
      t.string :bad_answers
      t.string :hint
      t.string :input_type
      t.string :picture
      t.integer :cost
      t.string :gift

      t.timestamps
    end
  end
end
