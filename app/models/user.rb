class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy

  has_many :contact_shares, dependent: :destroy

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :contact_favorites, dependent: :destroy,
    foreign_key: :user_id

  has_many :favorite_contacts,
    through: :contact_favorites,
    source: :favorite_contact

  has_many :contact_groups, dependent: :destroy

  def all_contacts
    contacts + shared_contacts
  end

  def grouped_contacts
    contact_groups.map { |group| group.contacts }
  end
end
