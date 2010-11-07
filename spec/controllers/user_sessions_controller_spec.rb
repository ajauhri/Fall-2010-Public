require 'spec_helper'

describe UserSessionsController do
  setup :activate_authlogic
  
  before(:each) do
    @valid_user = Factory.create(:valid_user)
  end

  it "should redirect to the root page" do
    post 'create' , :user_session => {:username => @valid_user.username,
      :password => @valid_user.password}

    response.should redirect_to :controller => 'projects', :action => 'index'
  end

  it 'should redirect to new if unsuccessful login' do
    post 'create'
    response.should render_template 'new'
  end

  it "should redirect to the login screen when logout" do
    post 'destroy' , :user_session => {:username => @valid_user.username,
      :password => @valid_user.password}

    response.should redirect_to login_path
  end

  it 'should render the new/login template when no user login' do
    get 'new'
    response.should redirect_to root_url
  end

  it 'should redirect to root url because user is logged in' do
    login_user
    get 'new'
    response.should redirect_to root_url
  end

  it 'should destroy user session' do
    login_user
    post 'destroy'
    response.should redirect_to login_path
  end
  
  it 'should check for a intruder and redirect to login_path' do
    login_user
    post :destroy, :id => 'intruder'
    flash[:error].should == "You're not allowed in here!"
    response.should redirect_to login_path
  end
  
  it "should redirect to login if current_user is not valid" do
    controller.should_receive(:current_user).and_return(false)
    post :destroy
    response.should redirect_to login_path
  end
end
