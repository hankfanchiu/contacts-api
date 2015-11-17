class ContactGroup < ActiveRecord::Base
  validates :contact_groupable_id, :user_id, presence: true
  validates :contact_groupable_id, uniqueness: { scope: :user_id }

  belongs_to :user

  has_many :contact_groupables, dependent: :destroy

  has_many :contacts,
    through: :contact_groupables,
    source: :contact
end
