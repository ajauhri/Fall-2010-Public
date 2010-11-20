require 'spec_helper'

describe EffortsController do
  setup :activate_authlogic
 # integrate_views

  def mock_effort(stubs ={})
    @mock_effort ||=mock_model(Effort,stubs)
  end
  
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end
  
  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end
  
  describe "GET index" do
    it "should render the index template" do
            
            # get :index
            # response.should render_template 'index'
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "should redirect to projects controller if project is not active" do
        Effort.stub!(:new).with(any_args()).and_return(mock_effort)
        controller.should_receive(:is_active).and_return(false)
        post :create, :effort => {:these => "params"}
        #response.should redirect_to(efforts_url(:controllers => :projects))
        response.should redirect_to(efforts_url)
      end

      it "should successfully update effort if project is active" do
         Effort.stub!(:new).with(any_args()).and_return(mock_effort)
          controller.should_receive(:is_active).and_return(true)
          controller.stub!(:error_html).and_return(true)
         @mock_effort.should_receive(:user=).and_return(current_user)
          @mock_effort.should_receive(:save).and_return(true)
          
        post :create, :effort => {:these => "params"}
        
        response.should redirect_to :action => 'index'
      end
    end

    describe "with invalid params" do
      it "should unsuccessfully create an effort" do
        Effort.stub!(:new).with(any_args()).and_return(mock_effort)
        controller.should_receive(:is_active).and_return(true)
        controller.stub!(:error_html).and_return(true)
       @mock_effort.should_receive(:user=).and_return(current_user)
        @mock_effort.should_receive(:save).and_return(false)
        
        post :create, :effort => {:these => "params"}
        flash[:error].should_not be_nil
        response.should redirect_to :action => 'index'
      end
    end
  end

  describe "DELETE destroy" do
    it "destroy action should destroy effort and redirect to effort index" do
      Effort.stub!(:find).with(any_args()).and_return(mock_effort)
      @mock_effort.should_receive(:destroy).and_return(true)
     delete :destroy, :id => "1"
    response.should redirect_to(efforts_url)
      
    end
  end

end
