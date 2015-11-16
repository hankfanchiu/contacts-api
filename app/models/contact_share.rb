class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, uniqueness: { scope: :user_id }
  # validate :user_id_contact_id_combo_validation

  belongs_to :user, dependent: :destroy
  belongs_to :contact

  # Not needed:
  # uniqueness: { scope: ___ } takes care of combo uniqueness

  # private
  # def user_id_contact_id_combo_validation
  #   params = {user_id: user_id, contact_id: contact_id}
  #   contact_share = ContactShare.find_by(params)
  #   if contact_share
  #     errors[:user_id_and_contact_id_combo] << "already exists"
  #   end
  # end
end
