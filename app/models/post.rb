class Post < ActiveRecord::Base
	belongs_to :homeroom
	default_scope -> { order('created_at DESC') }
  	validates :homeroom_id, presence: true
end
