class CreateGameModes < ActiveRecord::Migration[6.0]
  def change
    create_table :game_modes do |t|
      t.references :game, null: false, foreign_key: true
      t.references :mode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
