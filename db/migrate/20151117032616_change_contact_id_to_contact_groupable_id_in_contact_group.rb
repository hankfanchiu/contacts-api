class ChangeContactIdToContactGroupableIdInContactGroup < ActiveRecord::Migration
  def change
    rename_column :contact_groups, :contact_id, :contact_groupable_id
  end
end
