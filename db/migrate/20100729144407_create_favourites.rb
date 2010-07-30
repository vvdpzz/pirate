class CreateFavourites < ActiveRecord::Migration
  def self.up
    create_table :favourites do |t|
      t.references :user
      t.references :question

      t.timestamps
    end
  end

  def self.down
    drop_table :favourites
  end
end
