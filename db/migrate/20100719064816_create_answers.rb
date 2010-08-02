class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.text :body
      t.integer :correct, :default => 0
      
      t.integer :vote, :default => 0
      
      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :question_id
  end

  def self.down
    drop_table :answers
  end
end
