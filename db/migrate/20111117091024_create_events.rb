class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :repeat
      t.integer :repeat_frequency
      t.integer :repeat_after
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
