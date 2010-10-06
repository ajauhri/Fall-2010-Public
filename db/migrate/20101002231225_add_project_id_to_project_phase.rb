class AddProjectIdToProjectPhase < ActiveRecord::Migration
  def self.up
    add_column :project_phases, :project_id, :integer
  end

  def self.down
    remove_column :project_phases, :project_id
  end
end
