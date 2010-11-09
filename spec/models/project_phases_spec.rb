require 'spec_helper'

describe ProjectPhase do
  before(:all) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :sequence => 1,
      :total_estimated_effort => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    ProjectPhase.create!(@valid_attributes)
  end
  
  
 describe "create_from_lifecycle_phase" do
   
   it "should create all predefined phases from LifecyclePhases" do
    
    @lifecycle_phase = Factory.create(:lifecycle_phase)
    @project = Factory.create(:project_phase)
    @project_phase  = ProjectPhase.create_from_lifecycle_phase(@lifecycle_phase.id, @project)
    @project_phase.should be_valid
    @project_phase.lifecycle_phase.should == @lifecycle_phase
 
    end
 
   it "should assign a name to project phase from lifecycle phase" do
   
    @lifecycle_phase = Factory.create(:lifecycle_phase)
    @project = Factory.create(:project)
    @project_phase  = ProjectPhase.create_from_lifecycle_phase(@lifecycle_phase.id, @project)
    @project_phase.should be_valid
    @project_phase.name.should == @lifecycle_phase.name
 
 end
end

describe "create_delvierables method" do

  it "should create all typical deliverables in project phases" do
    
    lifecycle_phase = Factory(:lifecycle_project_phase)
    deliverable_type = Factory(:deliverable_type_project_phase);
    Factory(:typical_deliverable1_project_phase, :lifecycle_phase => lifecycle_phase, :deliverable_type => deliverable_type)
    Factory(:typical_deliverable2_project_phase, :lifecycle_phase => lifecycle_phase, :deliverable_type => deliverable_type)
    
    Factory(:project_phase_lifecycle, :lifecycle_phase => lifecycle_phase)
end
  end
  
end
