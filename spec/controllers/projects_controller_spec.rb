require 'spec_helper'

describe ProjectsController do
  setup :activate_authlogic
  #integrate_views
  
  def mock_project(stubs ={})
    @mock_project ||= mock_model(Project, stubs)
  end

  before(:all) do
    Factory.create(:project)
  end

  before(:each) do
    logout_user
    login_user
  end
  
  it "should create a new project" do
    get :new
    response.should render_template(:new)
    :project.should_not be_nil
  end


  it "should redirect to index with a notice on successful save" do
    Project.stub!(:new).and_return(mock_project)
    @mock_project.should_receive(:save).and_return(true)
    post :create
    flash[:notice].should_not be_nil
    response.should redirect_to(project_url(assigns[:project]))
  end
  
  
  it "should redirect to new with a notice on unsuccessful save" do
    Project.stub!(:new).and_return(mock_project)
    @mock_project.should_receive(:save).and_return(false)
    controller.stub!(:error_html).and_return(true)
    post :create
    flash[:error].should_not be_nil
    response.should render_template('new')
      end

  it "should redirect to index" do
    Project.any_instance.stubs(:valid?).returns(true)
    get 'index'
    response.should render_template(:index)
  end

  it "should show a project" do
    get :show, :id => Project.first
    response.should render_template(:show)
  end

  it "edit action should render edit template" do
    get :edit, :id => Project.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Project.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Project.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Project.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Project.first
    flash[:notice].should_not be_nil
    response.should redirect_to(:id => Project.first)
  end

  it "destroy action should destroy model and redirect to index action" do
    project = Project.first
    delete :destroy, :id => project
    response.should redirect_to(projects_url)
    Project.exists?(project.id).should be_false
  end
  
  it "should use sort method for phases within a project" do
    ProjectPhase.should_receive(:update_all).with(any_args()).twice.and_return(true)
    put :sort, :phaseslist => {:id => 1, id => 2}
  end
  
end
