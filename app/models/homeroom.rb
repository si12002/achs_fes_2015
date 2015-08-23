class Homeroom < ActiveRecord::Base
	has_one :users, dependent: :destroy
	has_many :posts, dependent: :destroy
end
