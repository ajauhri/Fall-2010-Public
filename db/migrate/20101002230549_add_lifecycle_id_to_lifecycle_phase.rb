class AddLifecycleIdToLifecyclePhase < ActiveRecord::Migration
  def self.up
    add_column :lifecycle_phases, :lifecycle_id, :integer
  end

  def self.down
    remove_column :lifecycle_phases, :lifecycle_id
  end
end
