class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :text
      t.string :status
      t.string :picture
      t.references :team, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
