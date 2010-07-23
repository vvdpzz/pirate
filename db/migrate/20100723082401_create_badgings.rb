class CreateBadgings < ActiveRecord::Migration
  def self.up
    create_table :badgings do |t|
      t.references :user
      t.references :badge
      t.integer :times, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :badgings
  end
end
