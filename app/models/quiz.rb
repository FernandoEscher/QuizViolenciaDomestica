class Quiz < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :created_at
  has_many :questions
  validates :name, presence: true

  accepts_nested_attributes_for :questions, 
    :reject_if => lambda { |a| a[:description].blank? }, 
    :allow_destroy => true
end