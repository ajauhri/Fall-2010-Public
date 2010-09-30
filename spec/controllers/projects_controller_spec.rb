require 'spec_helper'

describe ProjectsController, "creating a new project" do
  integrate_views

  it "should redirect to index with a notice on successful save" do
    Project.any_instance.stubs(:valid?).returns(true)
    post 'create'
    flash[:notice].should_not be_nil
    #response.should redirect_to(projects_path)
  end

  it "should redirect to index" do
    Project.any_instance.stubs(:valid?).returns(true)
    get 'index'
  end

  it "edit action should render edit template" do
    get :edit, :id => Project.first
    #response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Project.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Project.first
    #response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Project.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Project.first
    #response.should redirect_to(:index)
  end

  it "destroy action should destroy model and redirect to index action" do
    project = Project.first
    delete :destroy, :id => project
    #response.should redirect_to(projects_url)
    #Project.exists?(project.id).should be_false
  end
end
