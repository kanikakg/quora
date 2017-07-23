class Question < ActiveRecord::Base
	
  belongs_to :user
  has_many :answers 
  has_many :upvote_questions
  validates :content, presence: true, length:{maximum:250}

end
