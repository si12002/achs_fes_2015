class Post < ActiveRecord::Base
	belongs_to :homeroom
	default_scope -> { order('created_at DESC') }
	validates :title, presence: true
	validates :content, presence: true
  	validates :homeroom_id, presence: true
end
