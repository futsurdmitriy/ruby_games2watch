class AddPublishedAtProperty < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :publishedAt, :date
  end
end
