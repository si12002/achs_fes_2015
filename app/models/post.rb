class Post < ActiveRecord::Base
	belongs_to :homeroom
  	validates :homeroom_id, presence: true
end
