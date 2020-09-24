class RemoveRequirementFromGame < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :requirement_id, :references
  end
end
