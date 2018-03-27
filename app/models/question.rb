class Question < ApplicationRecord
  self.per_page = 5

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :question_topics
  has_many :topics, through: :question_topics
  has_many :notifications, dependent: :destroy

  validates :body, presence: { message: 'Question must not be blank.' }

  before_validation :set_topics, on: [:create]
  before_validation :capitalize_body, on: [:create]

  def related_questions
    QuestionTopic.where(topic: topics).map(&:question).uniq
  end

  def update_views
    self.views += 1
    save
  end

  def populate_topics!(topics)
    topics = parse_topics(topics)
    topics.each do |topic|
      new_topic = Topic.find_by name: topic
      if new_topic
        self.topics << new_topic
      else
        self.topics << Topic.create(name: topic)
      end
    end
  end

  private

  def parse_topics(topics)
    topics = topics.split(",").map(&:strip)
    topics.map { |topic| topic.split(" ").map(&:capitalize).join(" ") }
  end

  def capitalize_body
    self.body = self.body.capitalize
  end

  def set_topics
    general = Topic.find_by name: 'General'
    general = Topic.create(name: 'General') unless general
    if self.topics.blank?
      self.topics << general
    end
  end
end