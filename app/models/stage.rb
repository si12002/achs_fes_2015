class Stage < ActiveRecord::Base
	validates :name, presence: true
	validates :content, presence: true
	validates :day, presence: true
	validates :category, presence: true
end
