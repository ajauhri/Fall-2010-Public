require 'spec_helper'

describe PasswordsController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end

  describe "new" do
    it "should render the new template" do
      get :new
      response.should render_template('new')
    end

  end


  describe "edit" do
    it "should render the 'edit' forgotten password template" do
      User.should_receive(:find_using_perishable_token).once.and_return(mock_user)
      get :edit
      flash[:notice].should be_nil
      response.should render_template('edit')
    end
  end

  describe "update" do


    it "should update the password" do

      User.should_receive(:find_using_perishable_token).once.with('1').and_return(mock_user)
      @mock_user.should_receive(:update_attributes).with(any_args()).and_return(true)
      post :update, :id => 1, :user => 'xxx'
      assigns[:user].should == mock_user
      flash[:notice].should == "Password successfully changed"
      response.should redirect_to(root_url)
    end

    it "should fail in updating the password" do
      User.should_receive(:find_using_perishable_token).once.with('1').and_return(mock_user)
      @mock_user.should_receive(:update_attributes).with(any_args()).and_return(false)
      post :update, :id => 1, :user => 'xxx'
      assigns[:user].should == mock_user
      response.should render_template('edit')
    end

    it "should redirect to login url" do
      User.should_receive(:find_using_perishable_token).once.with('1').and_return(mock_user)
      post :update, :id => 1, :commit => 'Back'
      assigns[:user].should == mock_user
      response.should redirect_to(login_url)
    end

    it "should redirec to root url if the perishable token does not exist" do
      User.should_receive(:find_using_perishable_token).once.with('1').and_return(false)

      post :update, :id => 1, :user => 'xxx'
      flash[:notice].should == "We're sorry, but we could not locate your account. " +
      "If you are having issues try copying and pasting the URL " +
      "from your email into your browser or restarting the " +
      "reset password process."
      response.should redirect_to(root_url)
    end

  end

  describe "send password" do

    it "should send an email to a registered user" do
      User.stub!(:find_by_email).with(any_args()).and_return(mock_user)
      @mock_user.should_receive(:deliver_password_reset_instructions!).and_return(true)
      post :send_password, :user => 'xxx'
      flash[:notice].should == "An email has been sent to you with instructions on how to change your password"
      response.should redirect_to(login_url)
    end


    it "should fail in sending email if email does not exist" do
      User.stub!(:find_by_email).with(any_args()).and_return(false)
      post :send_password, :user => 'xxx'
      flash[:error].should == "The email address entered is not registered"
      response.should render_template('new')
    end

    it "should redirect to login url" do
      #User.stub!(:find_by_email).with(any_args()).and_return(false)
      post :send_password, :commit => 'Back'
      response.should redirect_to(login_url)
    end
  end
end
