class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.text :text
      t.string :image
      t.reference :author
      t.reference :comment

      t.timestamps
    end
  end
end
