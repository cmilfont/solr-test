class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.decimal :price
      t.timestamp :published_at

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end

