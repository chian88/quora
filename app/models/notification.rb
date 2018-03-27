class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :question

  default_scope { order('created_at DESC') }

  before_create :truncate_notification_size

  def truncate_notification_size
    if user.notifications.size > 5
      last_notification = user.notifications.last
      last_notification.destroy
    end
  end
end