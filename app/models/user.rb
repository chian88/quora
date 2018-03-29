class User < ApplicationRecord
  has_many :notifications
  has_many :answers
  has_many :questions
  has_many :votes

  has_secure_password validations: false

  has_many :user_topics
  has_many :topics, through: :user_topics

  validates :email, presence: true
  validates :email, uniqueness: {message: "email must be unique."}
  validates :password, length: {minimum: 5, message: "password must be mimimum of 5 characters"}
  validates :name, presence: true

  validate :password_alphanumeric

  def admin?
    self.position == 'admin'
  end

  def password_alphanumeric
    unless password =~ /[a-zA-Z]/ && password =~ /[0-9]/
      errors.add(:password, "password must contain both letters and numbers")
    end
  end
end

