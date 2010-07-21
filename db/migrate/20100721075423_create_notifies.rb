class CreateNotifies < ActiveRecord::Migration
  def self.up
    create_table :notifies do |t|
      t.references :user
      t.text :body
      t.integer :status, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :notifies
  end
end
