class Comment < ActiveRecord::Base
  validates :commentable_id, :commentable_type, :text, presence: true
  belongs_to :commentable, polymorphic: true

end
