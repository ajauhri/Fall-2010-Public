require 'spec_helper'

describe EffortsController do

  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end


  def mock_effort(stubs={})
    @mock_effort ||= mock_model(Effort, stubs)
  end
 

  describe "GET index" do
    it "should render the index template" do
      get :index
      response.should render_template 'index'
    end
  end


  describe "POST create" do

    describe "with valid params" do
      it "should successfully create an effort" do
        effort = Factory.build(:valid_effort)
        post :create, :effort => effort.attributes
        response.should redirect_to :action => 'index'
      end

      it "should successfully update effort" do
        #Effort.any_instance.stubs(:valid?).returns(true)
        effort = Factory.build(:valid_effort)
        post :create, :effort => effort.attributes#, :value => 5
        #effort.value.should_equal 10
        response.should redirect_to :action => 'index'
      end
    end

    describe "with invalid params" do
      it "should unsuccessfully create an effort" do
        
        #post :create
        #flash[:error].should_not be_nil
        #response.should redirect_to :action => 'index'
      end
    end
  end


  describe "DELETE destroy" do
=begin
    it "destroys the requested effort" do
      Effort.should_receive(:find).with("37").and_return(mock_effort)
      mock_effort.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the efforts list" do
      Effort.stubs(:find).and_return(mock_effort(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(efforts_url)
    end
=end
  end

end
