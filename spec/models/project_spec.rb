require 'spec_helper'

describe Project do

  before(:each) do
    @project = Project.new
    login_user
  end

  after :each do
    logout_user
  end
  
  it "should succed creating a new :project from the Factory (with lifecycle association)" do
    project = Factory.build(:project)
    project.new_record?
  end
  
  it "should be invalid without a name" do
    #@project.should_not be_valid
    @lifecycle = Factory.create(:lifecycle)
    @project.name = "Project XYZ"
    @project.lifecycle_id = @lifecycle.id
    @project.should be_valid
  end
  
  
    it "should create all typical deliverables in project phases" do
      lifecycle_project = Factory(:lifecycle_for_project)
      lifecycle_phase = Factory(:lifecycle_project_phase, :lifecycle_id => lifecycle_project)
      deliverable_type = Factory(:deliverable_type_project_phase);
      Factory(:typical_deliverable1_project_phase, :lifecycle_phase => lifecycle_phase, :deliverable_type => deliverable_type)
      Factory(:typical_deliverable2_project_phase, :lifecycle_phase => lifecycle_phase, :deliverable_type => deliverable_type)

      Factory(:project_phase_test, :lifecycle_id => lifecycle_project)
  end

end
# == Schema Information
#
# Table name: projects
#
#  id                     :integer         not null, primary key
#  name                   :string(255)
#  description            :text
#  total_estimated_effort :decimal(, )     default(0.0)
#  status                 :string(255)     default("Active")
#  actual_effort          :decimal(, )     default(0.0)
#  created_at             :datetime
#  updated_at             :datetime
#  lifecycle_id           :integer
#

