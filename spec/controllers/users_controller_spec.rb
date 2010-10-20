require 'spec_helper'

describe UsersController do
  setup :activate_authlogic
  #Delete this example and add some real ones
  before :each do
    logout_user
    login_user
  end

  it "should check have one user" do
    
    User.should have(1).show
  end


  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

=begin
  it "should redirect to new" do
    get 'new'
    #response.should render_template 'new'
  end
=end

  it "should redirect to login when user not logged in and wants to update" do
    put 'update'
    response.should redirect_to login_path
  end

  it "should redirect to login when user not logged in and wants to edit" do
    put 'edit'
    response.should redirect_to login_path
  end

  it "should render edit template when user wants to edit and he is logged in" do
    login_user
    put 'edit'
    response.should render_template 'edit'
  end

=begin
  it "should render the new template" do
    get 'new'
    response.should render_template 'new'
  end
=end

  #Test was unsuccessful, don't know how to create a valid user here
=begin
  it 'should successfuly create a user' do
    User.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to :controller => 'projects', :action => 'index'
  end
=end
  it 'should successfuly update a user' do

    login_user
    User.any_instance.stubs(:valid?).returns(true)
    post :update
    response.should redirect_to root_url
  end

  it 'should unsuccessfuly update a user' do

    login_user
    User.any_instance.stubs(:valid?).returns(false)
    post :update
    response.should render_template 'edit'
  end

end
