require 'spec_helper'

describe UserSessionsController do
  before(:each) do
    @valid_user = Factory.create(:valid_user)
    @user_session = UserSession.new
    @user_session.username = @valid_user.username
    @user_session.password = @valid_user.password

  end

  #Delete this example and add some real ones
  it "should use UserSessionsController" do
    controller.should be_an_instance_of(UserSessionsController)
  end

  it "should redirect to the root page" do
    post 'create' , :user_session => {:username => @valid_user.username,
                                      :password => @valid_user.password}

   response.should redirect_to :controller => 'projects', :action => 'index'
  end

    it "should redirect to the login screen when logout" do
    post 'destroy' , :user_session => @user_session

   response.should redirect_to login_path
  end

end
