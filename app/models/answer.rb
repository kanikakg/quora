class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :upvote_answers
   validates :content, presence: true

end
