class AddLifecyclePhaseIdToProjectPhase < ActiveRecord::Migration
  def self.up
    add_column :project_phases, :lifecycle_phase_id, :integer
  end

  def self.down
    remove_column :project_phases, :lifecycle_phase_id
  end
end
