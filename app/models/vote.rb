class Vote < ApplicationRecord
  belongs_to :answer, counter_cache: true
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => :answer_id
end