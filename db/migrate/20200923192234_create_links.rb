class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :source
      t.string :type

      t.timestamps
    end
  end
end
