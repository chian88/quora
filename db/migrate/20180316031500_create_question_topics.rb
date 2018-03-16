class CreateQuestionTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :question_topics do |t|
      t.integer :question_id, :topic_id
      t.timestamps
    end
  end
end
