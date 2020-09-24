class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.string :type
      t.string :operating_system
      t.integer :ram
      t.string :gpu
      t.string :cpu
      t.integer :free_space
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
