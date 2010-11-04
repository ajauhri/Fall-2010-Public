class ColumnsAddedForLoggingEffortAndTotalEstimation < ActiveRecord::Migration
  def self.up
    add_column :projects, :actual_effort, :decimal, :default => 0.0
    add_column :project_phases, :actual_effort, :decimal, :default => 0.0
    add_column :efforts, :effort_date, :datetime
    change_column :deliverables, :actual_effort, :decimal, :default => 0.0
    change_column :efforts, :value, :decimal, :default => 0.0
    change_column :deliverables, :estimated_effort, :decimal, :default => 0.0
    change_column :project_phases, :total_estimated_effort, :decimal, :default => 0.0
    change_column :projects, :total_estimated_effort, :decimal, :default => 0.0
  end

  def self.down
    remove_column :projects, :actual_effort
    remove_column :project_phases, :actual_effort
    remove_column :efforts, :effort_date, :datetime
    
  end
end
