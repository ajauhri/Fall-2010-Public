require 'spec_helper'

describe DeliverableTypesController do

  def mock_deliverable_type(stubs={})
    @mock_deliverable_type ||= mock_model(DeliverableType, stubs)
  end

  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end


  describe "GET new" do
    it "assigns a new deliverable_type as @deliverable_type" do
      DeliverableType.stub(:new).and_return(mock_deliverable_type)
      get :new
      assigns[:deliverable_type].should equal(mock_deliverable_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested deliverable_type as @deliverable_type" do
      DeliverableType.stub(:find).with("37").and_return(mock_deliverable_type)
      get :edit, :id => "37"
      assigns[:deliverable_type].should equal(mock_deliverable_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created deliverable_type as @deliverable_type" do
        DeliverableType.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable_type(:save => true))
        post :create, :deliverable_type => {:these => 'params'}
        assigns[:deliverable_type].should equal(mock_deliverable_type)
      end

      it "redirects to the created deliverable_type" do
        DeliverableType.stub(:new).and_return(mock_deliverable_type(:save => true))
        post :create, :deliverable_type => {}
        response.should redirect_to(:controller => 'catalogs')
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deliverable_type as @deliverable_type" do
        DeliverableType.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable_type(:save => false))
        controller.stub!(:error_html).and_return(true)
        post :create, :deliverable_type => {:these => 'params'}
        assigns[:deliverable_type].should equal(mock_deliverable_type)
      end

      it "re-renders the 'new' template" do
        DeliverableType.stub(:new).and_return(mock_deliverable_type(:save => false))
        controller.stub!(:error_html).and_return(true)
        post :create, :deliverable_type => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested deliverable_type" do
        DeliverableType.should_receive(:find).with("37").and_return(mock_deliverable_type)
        mock_deliverable_type.should_receive(:update_attributes).with({'these' => 'params'})
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "37", :deliverable_type => {:these => 'params'}
      end

      it "assigns the requested deliverable_type as @deliverable_type" do
        DeliverableType.stub(:find).and_return(mock_deliverable_type(:update_attributes => true))
        put :update, :id => "1"
        assigns[:deliverable_type].should equal(mock_deliverable_type)
      end

      it "redirects to the deliverable_type" do
        DeliverableType.stub(:find).and_return(mock_deliverable_type(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(:controller => 'catalogs')
      end
    end

    describe "with invalid params" do
      it "updates the requested deliverable_type" do
        DeliverableType.should_receive(:find).with("37").and_return(mock_deliverable_type)
        mock_deliverable_type.should_receive(:update_attributes).with({'these' => 'params'})
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "37", :deliverable_type => {:these => 'params'}
      end

      it "assigns the deliverable_type as @deliverable_type" do
        DeliverableType.stub(:find).and_return(mock_deliverable_type(:update_attributes => false))
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "1"
        assigns[:deliverable_type].should equal(mock_deliverable_type)
      end

      it "re-renders the 'edit' template" do
        DeliverableType.stub(:find).and_return(mock_deliverable_type(:update_attributes => false))
        controller.stub!(:error_html).and_return(true)
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested deliverable_type" do
      DeliverableType.should_receive(:find).with("37").and_return(mock_deliverable_type)
      mock_deliverable_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the deliverable_types list" do
      DeliverableType.stub(:find).and_return(mock_deliverable_type(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(:controller => 'catalogs')
    end
  end

end
