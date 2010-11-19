require 'spec_helper'

describe TypicalDeliverablesController do

  def mock_typical_deliverable(stubs={})
    @mock_typical_deliverable ||= mock_model(TypicalDeliverable, stubs)
  end

  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end

  describe "GET show" do
    it "assigns the requested typical_deliverable as @typical_deliverable" do
      TypicalDeliverable.stub(:find).with("37").and_return(mock_typical_deliverable)
      get :show, :id => "37"
      assigns[:typical_deliverable].should equal(mock_typical_deliverable)
    end
  end

  describe "GET new" do
    it "assigns a new typical_deliverable as @typical_deliverable" do
      TypicalDeliverable.stub(:new).and_return(mock_typical_deliverable)
      get :new
      assigns[:typical_deliverable].should equal(mock_typical_deliverable)
    end
  end

  describe "GET edit" do
    it "assigns the requested typical_deliverable as @typical_deliverable" do
      TypicalDeliverable.stub(:find).with("37").and_return(mock_typical_deliverable)
      get :edit, :id => "37"
      assigns[:typical_deliverable].should equal(mock_typical_deliverable)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created typical_deliverable as @typical_deliverable" do
        TypicalDeliverable.stub(:new).with({'these' => 'params'}).and_return(mock_typical_deliverable(:save => true))
        post :create, :typical_deliverable => {:these => 'params'}
        assigns[:typical_deliverable].should equal(mock_typical_deliverable)
      end

      it "redirects to the created typical_deliverable" do
        TypicalDeliverable.stub(:new).and_return(mock_typical_deliverable(:save => true))
        post :create, :typical_deliverable => {}
        response.should redirect_to(typical_deliverable_url(mock_typical_deliverable))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved typical_deliverable as @typical_deliverable" do
        TypicalDeliverable.stub(:new).with({'these' => 'params'}).and_return(mock_typical_deliverable(:save => false))
        post :create, :typical_deliverable => {:these => 'params'}
        assigns[:typical_deliverable].should equal(mock_typical_deliverable)
      end

      it "re-renders the 'new' template" do
        TypicalDeliverable.stub(:new).and_return(mock_typical_deliverable(:save => false))
        post :create, :typical_deliverable => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested typical_deliverable" do
        TypicalDeliverable.should_receive(:find).with("37").and_return(mock_typical_deliverable)
        mock_typical_deliverable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :typical_deliverable => {:these => 'params'}
      end

      it "assigns the requested typical_deliverable as @typical_deliverable" do
        TypicalDeliverable.stub(:find).and_return(mock_typical_deliverable(:update_attributes => true))
        put :update, :id => "1"
        assigns[:typical_deliverable].should equal(mock_typical_deliverable)
      end

      it "redirects to the typical_deliverable" do
        TypicalDeliverable.stub(:find).and_return(mock_typical_deliverable(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(typical_deliverable_url(mock_typical_deliverable))
      end
    end

    describe "with invalid params" do
      it "updates the requested typical_deliverable" do
        TypicalDeliverable.should_receive(:find).with("37").and_return(mock_typical_deliverable)
        mock_typical_deliverable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :typical_deliverable => {:these => 'params'}
      end

      it "assigns the typical_deliverable as @typical_deliverable" do
        TypicalDeliverable.stub(:find).and_return(mock_typical_deliverable(:update_attributes => false))
        put :update, :id => "1"
        assigns[:typical_deliverable].should equal(mock_typical_deliverable)
      end

      it "re-renders the 'edit' template" do
        TypicalDeliverable.stub(:find).and_return(mock_typical_deliverable(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested typical_deliverable" do
      TypicalDeliverable.should_receive(:find).with("37").and_return(mock_typical_deliverable)
      mock_typical_deliverable.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the typical_deliverables list" do
      TypicalDeliverable.stub(:find).and_return(mock_typical_deliverable(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(typical_deliverables_url)
    end
  end

end
