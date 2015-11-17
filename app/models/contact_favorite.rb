class ContactFavorite < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validates :user_id, uniqueness: { scope: :contact_id }

  belongs_to :favoritor,
    class_name: "User",
    foreign_key: :user_id

  belongs_to :favorite_contact,
    class_name: "Contact",
    foreign_key: :contact_id
end
