require 'spec_helper'

describe EffortsController do
  setup :activate_authlogic
  integrate_views

  before(:each) do
    logout_user
    login_user
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
        effort = Factory.create(:valid_effort)
        @logged_in_user.id = effort.user_id
        post :create, :effort => {:deliverable_id => effort.deliverable_id, :value => 5.0}
        effort.value.should == 5.0
        response.should redirect_to :action => 'index'
      end
    end

    describe "with invalid params" do
      it "should unsuccessfully create an effort" do
        post :create, :effort => {:deliverable_id => nil, :value => 5.0}
        flash[:error].should_not be_nil
        response.should redirect_to :action => 'index'
      end
    end
  end

  describe "DELETE destroy" do
    it "destroy action should destroy effort and redirect to effort index" do
      effort = Factory.create(:valid_effort)
      delete :destroy, :id => effort
      response.should redirect_to(efforts_url)
      Effort.exists?(effort.id).should be_false
    end
  end

end
