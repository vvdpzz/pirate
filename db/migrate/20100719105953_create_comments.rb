class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :user
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      
      t.integer :vote, :default => 0

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :commentable_id
    add_index :comments, :commentable_type
  end

  def self.down
    drop_table :comments
  end
end
