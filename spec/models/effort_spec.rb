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
   effort = Factory.create(:negative_effort_value)
   effort.value.should == 0
  end

describe " for project, phase, deliverable shall be updated after effort creation" do
  
  before(:all) do
    
    @testing_total_effort = Factory.create(:testing_total_effort)
    @deliverable_effort_init = @testing_total_effort.deliverable.actual_effort
  @project_phase_effort_init = @testing_total_effort.deliverable.project_phase.actual_effort
  @project_effort_init = @testing_total_effort.deliverable.project_phase.project.actual_effort
    @testing_total_effort2 = Factory.create(:testing_total_effort2, :deliverable => @testing_total_effort.deliverable)
  
  end
  
   it "should update project total effort" do  
     @project_effort_init == @testing_total_effort.value
    @testing_total_effort.deliverable.project_phase.project.actual_effort.should == @deliverable_effort_init + @testing_total_effort2.value
  end
    
        
        it "should update project phases total effort" do
           @project_phase_effort_init == @testing_total_effort.value
           @testing_total_effort.deliverable.project_phase.actual_effort.should == @deliverable_effort_init + @testing_total_effort2.value
        end
        
        
        it "should update deliverable effort" do
             @deliverable_effort_init.should == @testing_total_effort.value
            @testing_total_effort.deliverable.actual_effort.should == @deliverable_effort_init + @testing_total_effort2.value
           
        end
  end
end

# == Schema Information
#
# Table name: efforts
#
#  id             :integer         not null, primary key
#  value          :decimal(, )     default(0.0)
#  effort_date    :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  deliverable_id :integer
#  user_id        :integer
#

