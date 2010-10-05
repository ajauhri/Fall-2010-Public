class CreateDeliverableIdInEffort < ActiveRecord::Migration
  def self.up
    add_column :efforts, :deliverable_id, :integer
    rename_column :efforts, :username, :user_id
    change_column :efforts, :user_id, :integer
  end

  def self.down
    change_column :efforts, :user_id, :string
    rename_column :efforts, :user_id, :username
    remove_column :efforts, :deliverable_id
  end
end
