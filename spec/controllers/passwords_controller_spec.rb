require 'spec_helper'

describe PasswordsController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end


  it "should render the 'new' forgotten password template" do
    get :new
    response.should render_template('new')
  end


  it "should render the 'edit' forgotten password template" do
    controller.stub!(:load_user_using_perishable_token).and_return(true)
    get :edit
    response.should render_template('edit')
  end

  it "should update the password" do
    controller.stub!(:load_user_using_perishable_token).and_return(true)
    mock_user.stub!(:update_attributes).with({'these' => 'params'}).and_return(mock_user(:save => false))
    post :update
    response.should redirect_to(root_url)
  end


  it "should send an email" do
    User.stub(:find_by_email).with({'these' => 'params'}).and_return(mock_user(:save => false))
    mock_user.stub!(:deliver_password_reset_instructions!).and_return(true)
    post :send_password
    response.should redirect_to(login_url)
  end
end