class AddAuthorColumnToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :author, :string
  end
end
