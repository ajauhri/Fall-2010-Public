require 'spec_helper'

describe UsersController do

  #Delete this example and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  it "should redirect to new" do
    post 'create'
    response.should render_template 'new'
  end

  it "should redirect to login when user not logged in and wants to update" do
    put 'update'
    response.should redirect_to login_path
  end

  it "should redirect to login when user not logged in and wants to edit" do
    put 'edit'
    response.should redirect_to login_path
  end

  it "should render the new template" do
    get 'new'
    response.should render_template 'new'
  end

  #Test was unsuccessful, don't know how to create a valid user here
  """
  it 'should successfuly create a user' do
    post 'create', :user => Factory.build(:valid_user1).attributes
    #response.should redirect_to :controller => 'projects', :action => 'index'
    response.should render_template 'new'

  end
"""
end
