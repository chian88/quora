class User < ApplicationRecord
  has_many :notifications
  has_many :answers
  has_many :questions

  has_many :user_topics
  has_many :topics, through: :user_topics
end