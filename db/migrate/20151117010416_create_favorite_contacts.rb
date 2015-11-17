class CreateFavoriteContacts < ActiveRecord::Migration
  def change
    create_table :favorite_contacts do |t|
      t.integer :user_id, null: false
      t.integer :contact_id, null: false
      t.timestamps null: false
    end

    add_index :favorite_contacts, [:user_id, :contact_id], unique: true
  end
end
