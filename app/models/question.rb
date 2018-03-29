class Question < ApplicationRecord
  self.per_page = 5

  before_create :set_slug

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :question_topics
  has_many :topics, through: :question_topics
  has_many :notifications, dependent: :destroy

  validates :body, presence: { message: 'Question must not be blank.' }
  validates :body, uniqueness: { message: 'This question has been asked before.' }

  before_validation :set_default_topics, on: [:create]
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
      self.topics << ((Topic.find_by name: topic) || (Topic.create name: topic))
    end
  end

  def to_param
    self.slug
  end

  private

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless Question.where(slug: slug).exists?
    end
  end

  def parse_topics(topics)
    topics = topics.split(",").map(&:strip)
    topics.map { |topic| topic.split(" ").map(&:capitalize).join(" ") }
  end

  def capitalize_body
    self.body = self.body.capitalize
  end

  def set_default_topics
    if self.topics.blank?
      self.topics << (Topic.find_or_create_by name: 'General')
    end
  end
end