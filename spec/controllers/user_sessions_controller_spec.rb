require 'spec_helper'

describe UserSessionsController do
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
    reponse.should redirect_to 'new'
  end

  it "should redirect to the login screen when logout" do
    post 'destroy' , :user_session => {:username => @valid_user.username,
      :password => @valid_user.password}

    response.should redirect_to login_path
  end

  it 'should render the new/login template' do
    get 'new'
    reponse.should render_template 'new'
  end

  it 'should redirect to root url because user is logged in' do
    login_user
    get 'new'
    response.should redirect_to root_url
  end

  it 'should destroy user session' do
    login_user
    post 'destroy'
    reponse.should redirect_to 'new'
  end

end
