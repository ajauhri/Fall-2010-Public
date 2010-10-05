class CreateEfforts < ActiveRecord::Migration
  def self.up
    create_table :efforts do |t|
      t.float :value
      t.string :username

      t.timestamps
    end
  end

  def self.down
    drop_table :efforts
  end
end
