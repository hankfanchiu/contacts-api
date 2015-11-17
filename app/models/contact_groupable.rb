class ContactGroupable < ActiveRecord::Base
  validates :contact_id, :contact_group_id, presence: true
  validates :contact_id, uniqueness: { scope: :contact_group_id }

  belongs_to :contact
  belongs_to :contact_group
end
