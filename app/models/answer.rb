class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  has_many :votes

  default_scope { order('votes_count DESC') }

  def short_version
    words = body.split(' ')
    if words.size > 50
      words = words.take(50) << '...'
      return words.join(' ') 
    end
    body
  end 
end