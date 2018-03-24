class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :question_topics
  has_many :topics, through: :question_topics

  validates :body, presence: true

  def related_questions
    QuestionTopic.where(topic: topics).map(&:question).uniq
  end

  before_validation :set_topics, on: [:create]
  before_validation :capitalize_body, on: [:create]

  private

  def capitalize_body
    self.body = self.body.capitalize
  end

  def set_topics
    if self.topics.blank?
      self.topics << (Topic.find_by name: 'General')
    end
  end
end