class Topic < ApplicationRecord
  has_many :question_topics
  has_many :questions, through: :question_topics

  has_many :user_topics
  has_many :users, through: :user_topics
end