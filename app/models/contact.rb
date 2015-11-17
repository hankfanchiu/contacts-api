class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :email }

  belongs_to :owner, dependent: :destroy,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable

  has_many :contact_favorites,
    class_name: "FavoriteContact",
    primary_key: :id,
    foreign_key: :contact_id

  has_many :favoritors,
    through: :contact_favorites,
    source: :favoritor

  has_many :groups,
    class_name: "ContactGroup"



  # Not needed:
  # uniqueness: { scope: ___ } takes care of combo uniqueness

  # private
  # def user_id_email_combo_validation
  #   contact = Contact.find_by(user_id: user_id, email: email)
  #   if contact
  #     errors[:user_id_and_email_combo] << "already exists"
  #   end
  # end
end
