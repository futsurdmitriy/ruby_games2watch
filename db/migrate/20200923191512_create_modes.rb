class CreateModes < ActiveRecord::Migration[6.0]
  def change
    create_table :modes do |t|
      t.boolean :single
      t.boolean :cooperative
      t.boolean :online

      t.timestamps
    end
  end
end
