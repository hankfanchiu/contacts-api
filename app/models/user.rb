class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts

  has_many :contact_shares

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :comments, as: :commentable

  has_many :contact_favorites,
    class_name: "FavoriteContact",
    primary_key: :id,
    foreign_key: :user_id

  has_many :favorite_contacts,
    through: :contact_favorites,
    source: :favorite_contact

  has_many :groups,
    class_name: "ContactGroup"

  has_many :grouped_contacts,
    through: :groups,
    source: :contact

  def all_contacts
    contacts + shared_contacts
  end
end
