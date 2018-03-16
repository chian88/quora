class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :value
      t.integer :user_id, :answer_id
      t.timestamps
    end
  end
end
