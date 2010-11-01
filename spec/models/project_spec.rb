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
end