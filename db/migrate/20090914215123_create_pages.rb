class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.text :content
      t.integer :page
      t.belongs_to :book

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end

