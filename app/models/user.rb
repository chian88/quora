class User < ApplicationRecord
  has_many :notifications
  has_many :answers
  has_many :questions
  has_many :votes

  has_secure_password validations: false

  has_many :user_topics
  has_many :topics, through: :user_topics

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
end