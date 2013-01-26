class Question < ActiveRecord::Base
  attr_accessible :description
  belongs_to :quiz
  validates :description, presence: true

end