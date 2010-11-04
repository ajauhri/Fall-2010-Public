class CreateEfforts < ActiveRecord::Migration
  def self.up
    create_table :efforts do |t|
      t.decimal :value, :default => 0.0
      t.string :username
      t.datetime :effort_date
      

      t.timestamps
    end
  end

  def self.down
    drop_table :efforts
  end
end
