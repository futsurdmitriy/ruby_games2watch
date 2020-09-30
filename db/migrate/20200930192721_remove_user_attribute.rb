class RemoveUserAttribute < ActiveRecord::Migration[6.0]
  def change
    remove_column :news, :user, :integer
  end
end
