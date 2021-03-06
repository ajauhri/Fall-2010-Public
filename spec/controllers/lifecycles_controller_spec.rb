require 'spec_helper'

describe LifecyclesController do
  
  before(:each) do
     login_user
   end

   after(:each) do
     logout_user
   end

  def mock_lifecycle(stubs={})
    @mock_lifecycle ||= mock_model(Lifecycle, stubs)
  end


  describe "GET new" do
    it "assigns a new lifecycle as @lifecycle" do
      Lifecycle.stub(:new).and_return(mock_lifecycle)
      get :new
      assigns[:lifecycle].should equal(mock_lifecycle)
    end
  end

  describe "GET edit" do
    it "assigns the requested lifecycle as @lifecycle" do
      Lifecycle.stub(:find).with("37").and_return(mock_lifecycle)
      get :edit, :id => "37"
      assigns[:lifecycle].should equal(mock_lifecycle)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created lifecycle as @lifecycle" do
        Lifecycle.stub(:new).with({'these' => 'params'}).and_return(mock_lifecycle(:save => true))
        post :create, :lifecycle => {:these => 'params'}
        assigns[:lifecycle].should equal(mock_lifecycle)
      end

      it "redirects to the created lifecycle" do
        Lifecycle.stub(:new).and_return(mock_lifecycle(:save => true))
        post :create, :lifecycle => {}
        response.should redirect_to(:controller => 'catalogs')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lifecycle as @lifecycle" do
        Lifecycle.stub(:new).with({'these' => 'params'}).and_return(mock_lifecycle(:save => false))
        controller.stub!(:error_html).and_return(true)
        post :create, :lifecycle => {:these => 'params'}
        assigns[:lifecycle].should equal(mock_lifecycle)
      end

      it "re-renders the 'new' template" do
        Lifecycle.stub(:new).and_return(mock_lifecycle(:save => false))
        controller.stub!(:error_html).and_return(true)
        post :create, :lifecycle => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested lifecycle" do
        Lifecycle.should_receive(:find).with("37").and_return(mock_lifecycle)
        mock_lifecycle.should_receive(:update_attributes).with({'these' => 'params'})
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "37", :lifecycle => {:these => 'params'}
      end

      it "assigns the requested lifecycle as @lifecycle" do
        Lifecycle.stub(:find).and_return(mock_lifecycle(:update_attributes => true))
        put :update, :id => "1"
        assigns[:lifecycle].should equal(mock_lifecycle)
      end

      it "redirects to the lifecycle" do
        Lifecycle.stub(:find).and_return(mock_lifecycle(:update_attributes => true))
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "1"
        response.should redirect_to(:controller => 'catalogs')
      end
    end

    describe "with invalid params" do
      it "updates the requested lifecycle" do
        Lifecycle.should_receive(:find).with("37").and_return(mock_lifecycle)
        mock_lifecycle.should_receive(:update_attributes).with({'these' => 'params'})
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "37", :lifecycle => {:these => 'params'}
      end

      it "assigns the lifecycle as @lifecycle" do
        Lifecycle.stub(:find).and_return(mock_lifecycle(:update_attributes => false))
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "1"
        assigns[:lifecycle].should equal(mock_lifecycle)
      end

      it "re-renders the 'edit' template" do
        Lifecycle.stub(:find).and_return(mock_lifecycle(:update_attributes => false))
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested lifecycle" do
      Lifecycle.should_receive(:find).with("37").and_return(mock_lifecycle)
      mock_lifecycle.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the lifecycles list" do
      Lifecycle.stub(:find).and_return(mock_lifecycle(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(:controller => 'catalogs')
    end
  end

end
