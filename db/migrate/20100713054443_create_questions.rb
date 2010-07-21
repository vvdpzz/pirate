class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :user
      t.string :title
      t.text :body
      t.integer :views, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
