class ChangePublishedAtProperty < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :publishedAt, :published_at
  end
end
