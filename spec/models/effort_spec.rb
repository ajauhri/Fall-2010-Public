require 'spec_helper'

##
## Uncomment the lifecycle factory at some point
##

describe Effort do
  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end

   it "should create a valid effort log" do
    Factory.build(:valid_effort).should be_valid
  end

   it "should create an invalid effort log because of a string value" do
    Factory.build(:invalid_value).should be_invalid
  end

   it "should create an invalid effort log because of a nil deliverable id" do
    Factory.build(:invalid_deliverable).should be_invalid
  end

  it "should set a negative effort value to zero" do
   effort = Factory.build(:negative_effort_value)
   effort.value.should == 0
  end

describe Effort do
  
  before(:all) do
    @effort_project = Factory.build(:effort_project)
    @effort_project_phase = Factory.build(:effort_project_phase)
    @effort_delvierable =  Factory.build(:effort_deliverable)
    @testing_total_effort = Factory.build(:testing_total_effort)
  end
  
  it "should update project total effort" do
  #@effort_project.value.should == @testing_total_effort.value
end


it "should update project phases total effort" do

#@effort_project_phase.value.should == @testing_total_effort.value
end


it "should update deliverable effort" do

#@effort_deliverable.value.should == @testing_total_effort.value
end
end
end
