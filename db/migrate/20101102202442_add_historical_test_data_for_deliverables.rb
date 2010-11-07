class AddHistoricalTestDataForDeliverables < ActiveRecord::Migration
  def self.up
    Deliverable.create(:name => "Iteration Planning Meeting Minutes", :deliverable_type => "Iteration Plan",
      :estimated_effort => 5, :estimated_size => 5,
      :unit_of_measure => "Pages", :complexity => "LOW", :actual_size => 1,
      :actual_production_rate => 1, :actual_effort => 1, :project_phase_id => 3000)
    Deliverable.create(:name => "Iteration Planning Meeting Minutes", :deliverable_type => "Iteration Plan",
      :estimated_effort => 5, :estimated_size => 5,
      :unit_of_measure => "Pages", :complexity => "MEDIUM", :actual_size => 1,
      :actual_production_rate => 2, :actual_effort => 2, :project_phase_id => 3000)
    Deliverable.create(:name => "Iteration Planning Meeting Minutes", :deliverable_type => "Iteration Plan",
      :estimated_effort => 5, :estimated_size => 5,
      :unit_of_measure => "Pages", :complexity => "HIGH", :actual_size => 1,
      :actual_production_rate => 3, :actual_effort => 3, :project_phase_id => 3000)
       Deliverable.create(:name => "Requirements Document", :deliverable_type => "Requirements Document",
      :estimated_effort => 5, :estimated_size => 5,
      :unit_of_measure => "Pages", :complexity => "LOW", :actual_size => 1,
      :actual_production_rate => 2, :actual_effort => 2, :project_phase_id => 3000)
    Deliverable.create(:name => "Requirements Document", :deliverable_type => "Requirements Document",
      :estimated_effort => 5, :estimated_size => 5,
      :unit_of_measure => "Pages", :complexity => "MEDIUM", :actual_size => 1,
      :actual_production_rate => 4, :actual_effort => 4, :project_phase_id => 3000)
    Deliverable.create(:name => "Requirements Document", :deliverable_type => "Requirements Document",
      :estimated_effort => 5, :estimated_size => 5,
      :unit_of_measure => "Pages", :complexity => "HIGH", :actual_size => 1,
      :actual_production_rate => 6, :actual_effort => 6, :project_phase_id => 3000)
  end

  def self.down
  end
end
