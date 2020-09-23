class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :maximum_players
      t.integer :critics_rate

      t.timestamps
    end
  end
end
