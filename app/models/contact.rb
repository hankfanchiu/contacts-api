class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validate :user_id_email_combo_validation

  belongs_to :owner, dependent: :destroy,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  private
  def user_id_email_combo_validation
    contact = Contact.find_by(user_id: user_id, email: email)
    if contact
      errors[:user_id_and_email_combo] << "already exists"
    end
  end
end
