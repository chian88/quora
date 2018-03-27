class AddTimestampsToNotification < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :created_at, :datetime
    add_column :notifications, :updated_at, :datetime
  end
end
