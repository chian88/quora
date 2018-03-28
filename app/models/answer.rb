class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :votes, dependent: :destroy

  validates :body, presence: { message: 'Answer cannot be blank' }

  default_scope { order('votes_count DESC') }

  def short_version
    words = body.split(' ')
    if words.size > 50
      words = words.take(50) << '...'
      return words.join(' ') 
    end
    body
  end

  def generate_vote_notification(current_user)
    message = "#{current_user.name} has upvoted your answer. (#{question.body})"
    self.user.notifications.create(message: message, question: question) unless self.user == current_user
  end

  def generate_answer_notification(current_user)
    message = "#{current_user.name} has answered your question. (#{question.body})"
    question.user.notifications.create(message: message, question: question) unless question.user == current_user
  end
end