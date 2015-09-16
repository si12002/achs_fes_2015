class Homeroom < ActiveRecord::Base
	has_many :users, dependent: :destroy
	has_many :posts, dependent: :destroy
	validates :shop_name, presence: true
	validates :content, presence: true
	mount_uploader :icon, IconUploader
end
