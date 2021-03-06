require 'spec_helper'

describe LifecyclePhasesController do
  setup :activate_authlogic

  #integrate_views

  def mock_lifecycle_phase(stubs={})
    @mock_lifecycle_phase ||= mock_model(LifecyclePhase, stubs)
  end

  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end


  describe "GET new" do
    it "assigns a new lifecycle_phase as @lifecycle_phase" do
      LifecyclePhase.stub!(:new).and_return(mock_lifecycle_phase)
      get :new
      assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
    end
  end


  describe "GET edit" do
    it "assigns the requested lifecycle phase as @lifecycle_phase" do
      LifecyclePhase.stub(:find).with("37").and_return(mock_lifecycle_phase)
      get :edit, :id => "37"
      assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created lifecycle_phase as @lifecycle_phase" do
                LifecyclePhase.stub!(:new).with({'these' => 'params'}).and_return(mock_lifecycle_phase(:save => true))
                post :create, :lifecycle_phase => {:these => 'params'}
                assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
              end
        
      it "redirects to the created lifecycle_phase" do
        LifecyclePhase.stub!(:new).and_return(mock_lifecycle_phase(:save => true))
        controller.stub!(:error_html).and_return(true)
        post :create, :lifecycle_phase => {}
        response.should redirect_to(:controller => 'catalogs')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lifecycle_phase as @lifecycle_phase" do
        LifecyclePhase.stub!(:new).with({'these' => 'params'}).and_return(mock_lifecycle_phase(:save => false))
        controller.stub!(:error_html).and_return(true)
        post :create, :lifecycle_phase => {:these => 'params'}
        assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
      end

      it "re-renders the 'new' template" do
        LifecyclePhase.stub!(:new).and_return(mock_lifecycle_phase(:save => false))
        controller.stub!(:error_html).and_return(true)
        post :create, :lifecycle_phase => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested lifecycle_phase" do
        LifecyclePhase.should_receive(:find).with("37").and_return(mock_lifecycle_phase)
        mock_lifecycle_phase.should_receive(:update_attributes).with({'these' => 'params'})
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "37", :lifecycle_phase => {:these => 'params'}
      end

      it "assigns the requested lifecycle_phase as @lifecycle_phase" do
        LifecyclePhase.stub!(:find).with(any_args()).and_return(mock_lifecycle_phase)
        @mock_lifecycle_phase.should_receive(:update_attributes).once.with({'these' => 'params'}).and_return(true)
        put :update, :id => "1", :lifecycle_phase => {:these => 'params'}
        assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
        flash[:notice] == "LfecyclePhase was successfully updated."
        response.should redirect_to(:controller => 'catalogs')
      end

      it "redirects to the lifecycle_phase" do
        LifecyclePhase.stub!(:find).with(any_args()).and_return(mock_lifecycle_phase)
        @mock_lifecycle_phase.should_receive(:update_attributes).once.with({'these' => 'params'}).and_return(true)
        put :update, :id => "1", :lifecycle_phase => {:these => 'params'}
        response.should redirect_to(:controller => 'catalogs')
      end
    end

    describe "with invalid params" do
      it "updates the requested lifecycle_phase" do
        LifecyclePhase.should_receive(:find).with("37").and_return(mock_lifecycle_phase)
        mock_lifecycle_phase.should_receive(:update_attributes).with({'these' => 'params'})
controller.stub!(:error_html).and_return(true)
        put :update, :id => "37", :lifecycle_phase => {:these => 'params'}
      end

      it "assigns the lifecycle_phase as @lifecycle_phase" do
        LifecyclePhase.stub!(:find).and_return(mock_lifecycle_phase(:update_attributes => false))
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "1"
        assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
      end

      it "re-renders the 'edit' template" do
        LifecyclePhase.stub!(:find).and_return(mock_lifecycle_phase(:update_attributes => false))
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested lifecycle_phase" do
      LifecyclePhase.should_receive(:find).with("37").and_return(mock_lifecycle_phase)
      mock_lifecycle_phase.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the lifecycle_phases list" do
      LifecyclePhase.stubs(:find).returns(mock_lifecycle_phase(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(:controller => 'catalogs')
    end
  end

end
