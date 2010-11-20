require 'spec_helper'

describe Deliverable do
  before(:each) do
    @valid_attributes = {
      :name => "UI Doc",
      :deliverable_type => "none",
      :unit_of_measure => "pages",
      :complexity => "LOW",#Complexity::VALUES,
      :estimated_size => 10,
      :estimated_effort => 20,
      :estimated_production_rate => 3
    }
  end

  it "should create a new instance given valid attributes" do
    Deliverable.create!(@valid_attributes)
  end

  it "should fail with a complexity that does not exist in the complexity array" do
    deliverable = Deliverable.create!(@valid_attributes)
    deliverable.complexity = "xxx"
    deliverable.should be_invalid
  end

  it "should fail if effort not > 0" do
    deliverable = Deliverable.create!(@valid_attributes)
    deliverable.estimated_effort = -1
    deliverable.should be_invalid
  end

  it "should fail if size not > 0 " do
    deliverable = Deliverable.create!(@valid_attributes)
    deliverable.estimated_size = -1
    deliverable.should be_invalid
  end
end

describe Deliverable , "from a typical deliverable and a phase" do
  before :all do
    DeliverableType.delete_all
    @deliverable_type = DeliverableType.create!(:name => 'Requirements Document1',
    :unit_of_measure => 'pages')
  end

  it "should create a deliverablie for a project phase from a typical deliverable" do

    typical_deliverable = TypicalDeliverable.create!(:name => 'Concept Document1', :deliverable_type_id => @deliverable_type.id,
    :estimated_size => 10, :estimated_effort => 20, :estimated_production_rate => 3,
    :complexity => 'LOW')
    project_phase_id = 1
    deliverable = Deliverable.create_from_typical_deliverable(typical_deliverable.id, project_phase_id)
    deliverable.should be_valid
  end
end


describe Deliverable, "should estimate based upon matching type and complexity" do

  before(:all) do
    Factory.create(:low_complex_minutes1)
    Factory.create(:low_complex_minutes2)
    Factory.create(:low_complex_minutes3)
    Factory.create(:high_complex_requirements1)
    Factory.create(:high_complex_requirements2)
    Factory.create(:high_complex_requirements3)
  end

  it "should return accurate estimates for highly complex requirements doc" do
    estimates = Deliverable.get_estimates('Requirements Document', 'HIGH')
    estimates[:max_size].should == 3
    estimates[:min_size].should >=2
    estimates[:avg_size].should <=4 
    estimates[:max_effort].should equal(6)
    estimates[:min_effort].should equal(2)
    estimates[:avg_effort].should >=4
    estimates[:max_rate].should equal(6)
    estimates[:min_rate].should equal(2)
    estimates[:avg_rate].should >=4
  end

  describe "should update project, phase total_estimated_effort" do

    before(:all) do
      @testing_deliverable = Factory.create(:effort_deliverable)
      @phase_init = @testing_deliverable.project_phase.total_estimated_effort
      @project_init = @testing_deliverable.project_phase.project.total_estimated_effort
      @testing_deliverable2 = Factory.create(:effort_deliverable2, :project_phase => @testing_deliverable.project_phase)
    end

    it "should update project total estimated effort" do
      @project_init.should == @testing_deliverable.estimated_effort
      @testing_deliverable.project_phase.project.total_estimated_effort.should == @phase_init + @testing_deliverable2.estimated_effort
    end


    it "should update project phases total estimated effort" do
      @phase_init.should == @testing_deliverable.estimated_effort
      @testing_deliverable.project_phase.total_estimated_effort.should == @phase_init + @testing_deliverable2.estimated_effort
    end
  end



  describe "should increment project and project phase estimated effort values after deliverable creation" do

    before(:all) do
      @deliverable1 = Factory.create(:effort_deliverable)  
      @init_estimated_effort_for_project_phase = ProjectPhase.find(@deliverable1.project_phase).total_estimated_effort
      @init_estimated_effort_for_project = Project.find(@deliverable1.project_phase.project).total_estimated_effort
      @deliverable2 = Factory.create(:effort_deliverable2, :project_phase => @deliverable1.project_phase)
    end

    it "should update project total effort" do
      @init_estimated_effort_for_project.should == @deliverable1.estimated_effort
      Project.find(@deliverable1.project_phase.project).total_estimated_effort.should == @init_estimated_effort_for_project + @deliverable2.estimated_effort
    end

    it "should update project phases total effort" do
      @init_estimated_effort_for_project_phase == @deliverable1.estimated_effort
      ProjectPhase.find(@deliverable1.project_phase).total_estimated_effort.should == @init_estimated_effort_for_project_phase + @deliverable2.estimated_effort
    end
  end

  describe "should decrement project and project phase estimated effort values after deliverable deletion" do

    before(:each) do
      @deliverable1 = Factory.create(:effort_deliverable)
    end

    it "should decrement project total estimated effort" do
      @init_estimated_effort_for_project = Project.find(@deliverable1.project_phase.project).total_estimated_effort
      @init_estimated_effort_for_project.should == @deliverable1.estimated_effort
      @project = Project.find(@deliverable1.project_phase.project)
      @estimated_effort = @deliverable1.estimated_effort
      Deliverable.destroy(@deliverable1)
      Project.find(@project).total_estimated_effort.should == @init_estimated_effort_for_project - @estimated_effort
    end

    it "should decrement project phase total estimated effort" do
      @init_estimated_effort_for_project_phase = ProjectPhase.find(@deliverable1.project_phase).total_estimated_effort
      @init_estimated_effort_for_project_phase.should == @deliverable1.estimated_effort
      @project_phase = ProjectPhase.find(@deliverable1.project_phase)
      @estimated_effort = @deliverable1.estimated_effort
      Deliverable.destroy(@deliverable1)
      ProjectPhase.find(@project_phase).total_estimated_effort.should == @init_estimated_effort_for_project_phase - @estimated_effort
    end
  end
end


# == Schema Information
#
# Table name: deliverables
#
#  id                        :integer         not null, primary key
#  name                      :string(255)
#  description               :text
#  deliverable_type          :string(255)
#  unit_of_measure           :string(255)
#  complexity                :string(255)
#  estimated_size            :decimal(, )
#  estimated_effort          :decimal(, )     default(0.0)
#  estimated_production_rate :decimal(, )
#  actual_size               :decimal(, )
#  actual_effort             :decimal(, )     default(0.0)
#  actual_production_rate    :decimal(, )
#  project_phase_id          :integer
#  created_at                :datetime
#  updated_at                :datetime
#

