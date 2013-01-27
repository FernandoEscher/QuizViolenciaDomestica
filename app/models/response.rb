class Response < ActiveRecord::Base
  belongs_to :question
  attr_accessible :answer, :phone
end
