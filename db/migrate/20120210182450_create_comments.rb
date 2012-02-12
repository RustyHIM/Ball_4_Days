class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :goer_id

      t.timestamps
    end
	add_index :comments, [:goer_id], :unique => true
  end

  def self.down
    drop_table :comments
  end
end
