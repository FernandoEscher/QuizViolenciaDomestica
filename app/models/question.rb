class Question < ActiveRecord::Base
  attr_accessible :description
  belongs_to :quiz
  has_many :responses
  validates :description, presence: true

end