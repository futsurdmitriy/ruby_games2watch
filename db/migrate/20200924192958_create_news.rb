class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.text :text
      t.string :headline
      t.string :image
      t.timestamps
    end
  end
end
