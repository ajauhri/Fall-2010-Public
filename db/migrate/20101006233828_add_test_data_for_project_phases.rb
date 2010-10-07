class AddTestDataForProjectPhases < ActiveRecord::Migration
  def self.up
    ProjectPhases.delete_all

    project_xyz = Project.find_by_name("Project XYZ")
    project_xyz.create_phases


    project_rails = Project.find_by_name("Project Rails")
    project_rails.create_phases

  end

  def self.down
    ProjectPhases.delete_all
  end
end
