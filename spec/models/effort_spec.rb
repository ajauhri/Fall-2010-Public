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
    
    @effort1 = Factory.create(:effort1)
    @init_actual_effort_for_deliverable = Deliverable.find(@effort1.deliverable).actual_effort
  @init_actual_effort_for_project_phase = ProjectPhase.find(@effort1.deliverable.project_phase).actual_effort
  @init_actual_effort_for_project = Project.find(@effort1.deliverable.project_phase.project).actual_effort
    @effort2 = Factory.create(:effort2, :deliverable => @effort1.deliverable)
  
  end
  
   it "should update project total effort" do  
     @init_actual_effort_for_project.should == @effort1.value
    Project.find(@effort1.deliverable.project_phase.project).actual_effort.should == @init_actual_effort_for_project + @effort2.value
  end
    
        
   it "should update project phases total effort" do
     @init_actual_effort_for_project_phase == @effort1.value
     ProjectPhase.find(@effort1.deliverable.project_phase).actual_effort.should == @init_actual_effort_for_project_phase + @effort2.value
   end
        
        
   it "should update deliverable effort" do
      @init_actual_effort_for_deliverable.should == @effort1.value
      Deliverable.find(@effort1.deliverable).actual_effort.should == @init_actual_effort_for_deliverable + @effort2.value
    end
  end


describe " for project, phase, deliverable shall be updated after deletion" do
  
  before(:each) do
    @effort1 = Factory.create(:effort1)  
  end
  
   it "should update deliverable actual_effort" do
       @init_actual_effort_for_deliverable = Deliverable.find(@effort1.deliverable).actual_effort     
    
         @init_actual_effort_for_deliverable.should == @effort1.value
         @deliverable = Deliverable.find(@effort1.deliverable)
         @effort_value = @effort1.value
         Effort.destroy(@effort1)
         Deliverable.find(@deliverable).actual_effort.should == @init_actual_effort_for_deliverable - @effort_value
       
    end
       
           
  it "should update project phase actual effort" do
       @init_actual_effort_for_project_phase = ProjectPhase.find(@effort1.deliverable.project_phase).actual_effort
       @init_actual_effort_for_project_phase.should == @effort1.value
       @project_phase = ProjectPhase.find(@effort1.deliverable.project_phase)
       @effort_value = @effort1.value
       Effort.destroy(@effort1)
       ProjectPhase.find(@project_phase).actual_effort.should == @init_actual_effort_for_project_phase - @effort_value
   end
           
  it "should update project actual effort" do  
      @init_actual_effort_for_project = Project.find(@effort1.deliverable.project_phase.project).actual_effort
      @init_actual_effort_for_project.should == @effort1.value
      @project = Project.find(@effort1.deliverable.project_phase.project)
      @effort_value = @effort1.value
      Effort.destroy(@effort1)
      Project.find(@project).actual_effort.should == @init_actual_effort_for_project - @effort_value
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

