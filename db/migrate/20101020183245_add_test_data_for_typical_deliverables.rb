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
      :unit_of_measure => 'pages', :complexity => 'Low', :lifecycle_phase_id => systemConceptId)
    TypicalDeliverable.create(:name => 'Viability Study1', :deliverable_type => 'Viability Study',
      :unit_of_measure => 'pages', :complexity => 'Low', :lifecycle_phase_id => systemConceptId )

    TypicalDeliverable.create(:name => 'Requirements Document1', :deliverable_type => 'Requirements Document',
      :unit_of_measure => 'pages', :complexity => 'Medium', :lifecycle_phase_id => systemRequirementsId )
    TypicalDeliverable.create(:name => 'Requirements Document2', :deliverable_type => 'Requirements Document',
      :unit_of_measure => 'pages', :complexity => 'Medium', :lifecycle_phase_id => systemRequirementsId )

    TypicalDeliverable.create(:name => 'High Level Design Document1', :deliverable_type => 'Design Document',
      :unit_of_measure => 'Low', :complexity => 'low', :lifecycle_phase_id => systemDesignId )
    TypicalDeliverable.create(:name => 'Software Architecture Document1', :deliverable_type => 'Software Architecture Document',
      :unit_of_measure => 'pages', :complexity => 'High', :lifecycle_phase_id => systemDesignId )

    TypicalDeliverable.create(:name => 'Release Planning Meeting Minutes', :deliverable_type => 'Release Planning Meeting Minutes', :unit_of_measure => '',
      :complexity => '', :lifecycle_phase_id => iteration0id )
    TypicalDeliverable.create(:name => 'Weekly Planning Meeting Minutes1', :deliverable_type => 'Weekly Planning Meeting Minutes', :unit_of_measure => '',
      :complexity => '', :lifecycle_phase_id => iteration0id )

    TypicalDeliverable.create(:name => 'Iteration 1 Planning Meeting Minutes', :deliverable_type => 'Iteration Planning Meeting Minutes', :unit_of_measure => '',
      :complexity => '', :lifecycle_phase_id => iteration1id )
    TypicalDeliverable.create(:name => 'Weekly Planning Meeting Minutes1', :deliverable_type => 'Weekly Planning Meeting Minutes', :unit_of_measure => '',
      :complexity => '', :lifecycle_phase_id => iteration1id )

    TypicalDeliverable.create(:name => 'Iteration 2 Planning Meeting Minutes', :deliverable_type => 'Iteration Planning Meeting Minutes', :unit_of_measure => '',
      :complexity => '', :lifecycle_phase_id => iteration2id )
    TypicalDeliverable.create(:name => 'Weekly Planning Meeting Minutes1', :deliverable_type => 'Weekly Planning Meeting Minutes', :unit_of_measure => '',
      :complexity => '', :lifecycle_phase_id => iteration2id )
       
  end

  def self.down
    TypicalDeliverable.delete_all
  end
end