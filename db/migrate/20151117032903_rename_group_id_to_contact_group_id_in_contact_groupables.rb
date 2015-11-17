class RenameGroupIdToContactGroupIdInContactGroupables < ActiveRecord::Migration
  def change
    rename_column :contact_groupables, :group_id, :contact_group_id
  end
end
