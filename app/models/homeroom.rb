class Homeroom < ActiveRecord::Base
	has_one :users, dependent: :destroy
	has_many :posts, dependent: :destroy
	validates :shop_name, presence: true
	validates :content, presence: true
end
