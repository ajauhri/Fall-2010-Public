class AddTestDataForDeliverableTypes < ActiveRecord::Migration
  def self.up
    DeliverableType.delete_all
    DeliverableType.create(:name => 'Requirements Document', :unit_of_measure => 'pages')
    DeliverableType.create(:name => 'URD', :unit_of_measure => 'pages')
    DeliverableType.create(:name => 'UI Mockup', :unit_of_measure => 'screens')
    DeliverableType.create(:name => 'Test Document', :unit_of_measure => 'pages')
    DeliverableType.create(:name => 'Iteration Plan', :unit_of_measure => 'pages')
    DeliverableType.create(:name => 'Release Plan', :unit_of_measure => 'pages')
    DeliverableType.create(:name => 'Functional Test', :unit_of_measure => 'examples')
  end

  def self.down
    DeliverableType.delete_all
  end
end
