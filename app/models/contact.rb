class Contact < ActiveRecord::Base
  validates :email, :name, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_many :contact_shares, dependent: :destroy

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :contact_favorites, dependent: :destroy,
    foreign_key: :contact_id

  has_many :favoritors,
    through: :contact_favorites,
    source: :favoritor

  has_many :contact_groupables, dependent: :destroy

  has_many :contact_groups,
    through: :contact_groupables,
    source: :contact_group
end
