require 'spec_helper'

describe UsersController do

  #Delete this example and add some real ones
  it "should use UsersController" do
    controller.should be_an_instance_of(UsersController)
  end

  it "should redirect to new" do
    post 'create'
    response.should redirect_to :action => 'new'

    put 'update'
    response.should redirect_to :action => 'new'
  end

  it "should render the new template" do
    get 'new'
    response.should render_template 'new'
  end

  it "should successfuly create a user" do
    post 'create', :user => Factory.build(:valid_user).attributes
    response.should redirect_to root_url
  end

end
