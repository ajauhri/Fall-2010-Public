class FixUserIdInEffort < ActiveRecord::Migration
  def self.up
    remove_column :efforts, :user_id
    add_column :efforts, :user_id, :integer
  end

  def self.down
    remove_column :efforts, :user_id
    add_column :efforts, :user_id, :integer
  end
end
