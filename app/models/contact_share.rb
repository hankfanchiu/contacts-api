class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validate :user_id_contact_id_combo_validation

  belongs_to :user

  belongs_to :contact

  private
  def user_id_contact_id_combo_validation
    params = {user_id: user_id, contact_id: contact_id}
    contact_share = ContactShare.find_by(params)
    if contact_share
      errors[:user_id_and_contact_id_combo] << "already exists"
    end
  end
end
