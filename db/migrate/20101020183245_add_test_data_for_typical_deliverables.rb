class AddTestDataForTypicalDeliverables < ActiveRecord::Migration
  def self.up
    TypicalDeliverable.delete_all
    systemConceptId = LifecyclePhase.find_by_name('System Concept').id
    systemRequirementsId = LifecyclePhase.find_by_name('System Requirements').id
    systemDesignId = LifecyclePhase.find_by_name('System Design').id
    iteration0id = LifecyclePhase.find_by_name('Iteration 0').id
    iteration1id = LifecyclePhase.find_by_name('Iteration 1').id
    iteration2id = LifecyclePhase.find_by_name('Iteration 2').id

    TypicalDeliverable.create(:name => 'Concept Document1', :deliverable_type => 'Concept Document',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'LOW', :lifecycle_phase_id => systemConceptId)

    TypicalDeliverable.create(:name => 'Viability Study1', :deliverable_type => 'Viability Study',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'LOW', :lifecycle_phase_id => systemConceptId )

    TypicalDeliverable.create(:name => 'Requirements Document1', :deliverable_type => 'Requirements Document',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'MEDIUM', :lifecycle_phase_id => systemRequirementsId )

    TypicalDeliverable.create(:name => 'Requirements Document2', :deliverable_type => 'Requirements Document',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'MEDIUM', :lifecycle_phase_id => systemRequirementsId )

    TypicalDeliverable.create(:name => 'HIGH Level Design Document1', :deliverable_type => 'Design Document',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'LOW', :complexity => 'LOW', :lifecycle_phase_id => systemDesignId )

    TypicalDeliverable.create(:name => 'Software Architecture Document1', :deliverable_type => 'Software Architecture Document',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'HIGH', :lifecycle_phase_id => systemDesignId )

    TypicalDeliverable.create(:name => 'Release Planning Meeting Minutes', :deliverable_type => 'Release Planning Meeting Minutes',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'HIGH', :lifecycle_phase_id => iteration0id )

    TypicalDeliverable.create(:name => 'Weekly Planning Meeting Minutes1', :deliverable_type => 'Weekly Planning Meeting Minutes',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'LOW', :lifecycle_phase_id => iteration0id )

    TypicalDeliverable.create(:name => 'Iteration 1 Planning Meeting Minutes', :deliverable_type => 'Iteration Planning Meeting Minutes',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'MEDIUM', :lifecycle_phase_id => iteration1id )

    TypicalDeliverable.create(:name => 'Weekly Planning Meeting Minutes1', :deliverable_type => 'Weekly Planning Meeting Minutes',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'LOW', :lifecycle_phase_id => iteration1id )

    TypicalDeliverable.create(:name => 'Iteration 2 Planning Meeting Minutes', :deliverable_type => 'Iteration Planning Meeting Minutes',
      :estimated_size => 10, :estimated_effort => 20,
      :unit_of_measure => 'pages', :complexity => 'MEDIUM', :lifecycle_phase_id => iteration2id )
    
    TypicalDeliverable.create(:name => 'Weekly Planning Meeting Minutes1', :deliverable_type => 'Weekly Planning Meeting Minutes',
      :estimated_size => 10, :estimated_effort => 20,
     :unit_of_measure => 'pages', :complexity => 'LOW', :lifecycle_phase_id => iteration2id )
       
  end

  def self.down
    TypicalDeliverable.delete_all
  end
end
