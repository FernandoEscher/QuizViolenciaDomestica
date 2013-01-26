class Quiz < ActiveRecord::Base
	attr_accessible :name
	has_many :quiestions
	validates :name, presence: true
end