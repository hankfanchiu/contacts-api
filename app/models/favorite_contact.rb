class FavoriteContact < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validates :user_id, uniqueness: { scope: :contact_id }

  belongs_to :favoritor,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :favorite_contact,
    class_name: "Contact",
    primary_key: :id,
    foreign_key: :contact_id
end
