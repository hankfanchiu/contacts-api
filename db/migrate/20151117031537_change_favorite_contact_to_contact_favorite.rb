class ChangeFavoriteContactToContactFavorite < ActiveRecord::Migration
  def change
    rename_table :favorite_contacts, :contact_favorites
  end
end
