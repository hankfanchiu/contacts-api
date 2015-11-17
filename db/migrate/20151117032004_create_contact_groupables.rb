class CreateContactGroupables < ActiveRecord::Migration
  def change
    create_table :contact_groupables do |t|
      t.integer :contact_id, null: false
      t.integer :group_id, null: false
      t.timestamps null: false
    end

    add_index :contact_groupables, [:contact_id, :group_id], unique: true
  end
end
