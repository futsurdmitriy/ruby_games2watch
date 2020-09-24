class RemoveAuthorFromNews < ActiveRecord::Migration[6.0]
  def change
    remove_column :news, :author_id, :references
  end
end
