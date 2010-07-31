class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.references :user
      t.string :display_name
      t.string :real_name
      t.integer :age
      t.string :gender
      t.integer :reputation, :default => 1
      t.string :website, :default => "http://"
      t.string :location
      t.string :school
      t.text :about_me

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
