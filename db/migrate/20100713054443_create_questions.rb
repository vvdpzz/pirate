class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :user
      t.string :title
      t.text :body
      t.references :answer, :default => 0
      # correct answer ID
      t.integer :status, :default => 0
      # 0 -> normal
      # 1 -> closed
      # 2 -> reopen
      # 3 -> delete
      t.integer :featured, :default => 0
      # featured = featured.to_i if featured > 0
      t.integer :views, :default => 0
      
      t.integer :vote, :default => 0
      
      # selected version
      t.integer :selected_version, :default => 0
      
      # commit message
      t.string :commit_message

      t.timestamps
    end
    add_index :questions, :user_id
  end

  def self.down
    drop_table :questions
  end
end
