class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :critics_rate
      t.string :genre
      t.string :company
      t.string :publisher
      t.references :requirement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
