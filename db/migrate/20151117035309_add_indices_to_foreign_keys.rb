class AddIndicesToForeignKeys < ActiveRecord::Migration
  def change
    add_index :contact_favorites, :user_id
    add_index :contact_favorites, :contact_id
    add_index :contact_groupables, :contact_id
    add_index :contact_groupables, :contact_group_id
    add_index :contact_groups, :user_id
    add_index :contact_groups, :contact_groupable_id
  end
end
