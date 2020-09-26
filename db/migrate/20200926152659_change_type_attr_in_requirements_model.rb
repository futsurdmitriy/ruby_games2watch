class ChangeTypeAttrInRequirementsModel < ActiveRecord::Migration[6.0]
  def change
    rename_column :requirements, :type, :req_type
  end
end
