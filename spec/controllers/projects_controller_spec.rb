require 'spec_helper'

describe ProjectsController, "creating a new project" do
  integrate_views

  before(:each) do

  end

  it "should redirect to index with a notice on successful save" do
    Project.any_instance.stubs(:valid?).returns(true)
    post 'create'
    flash[:notice].should_not be_nil
    response.should redirect_to(projects_path)
  end


end
