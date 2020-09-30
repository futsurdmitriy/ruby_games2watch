class ChangeAuthorColumnInNews < ActiveRecord::Migration[6.0]
  def change
    remove_column :news, :author, :string
    add_column :news, :user, :integer, references: :user
  end
end
