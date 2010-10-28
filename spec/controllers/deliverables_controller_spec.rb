require 'spec_helper'

describe DeliverablesController do

  def mock_deliverable(stubs={})
    @mock_deliverable ||= mock_model(Deliverable, stubs)
  end

    before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end

=begin
  describe "GET index" do
    it "assigns all deliverables as @deliverables" do
      Deliverable.stub(:find).with(:all).and_return([mock_deliverable])
      get :index
      assigns[:deliverables].should == [mock_deliverable]
    end
  end
=end

  describe "GET show" do
    it "assigns the requested deliverables as @deliverables" do
      Deliverable.stub(:find).with("37").and_return(mock_deliverable)
      get :show, :id => "37"
      assigns[:deliverable].should equal(mock_deliverable)
    end
  end

  describe "GET new" do
    it "assigns a new deliverable as @deliverable" do
      Deliverable.stub(:new).and_return(mock_deliverable)
      get :new
      assigns[:deliverable].should equal(mock_deliverable)
    end
  end

  describe "GET edit" do
    it "assigns the requested deliverable as @deliverable" do
      Deliverable.stub(:find).with("37").and_return(mock_deliverable)
      get :edit, :id => "37"
      assigns[:deliverable].should equal(mock_deliverable)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created deliverable as @deliverable" do
        Deliverable.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable(:save => true))
        post :create, :deliverable => {:these => 'params'}
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "redirects to the created deliverables" do
        Deliverable.stub(:new).and_return(mock_deliverable(:save => true))
        post :create, :deliverable => {}
        response.should redirect_to(deliverable_url(mock_deliverable))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deliverable as @deliverable" do
        Deliverable.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable(:save => false))
        post :create, :deliverable => {:these => 'params'}
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "re-renders the 'new' template" do
        Deliverable.stub(:new).and_return(mock_deliverable(:save => false))
        post :create, :deliverable => {}
        response.should render_template('new')
      end
    end
  end


  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested deliverable" do
        Deliverable.should_receive(:find).with("37").and_return(mock_deliverable)
        mock_deliverable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :deliverable => {:these => 'params'}
      end

      it "assigns the requested deliverables as @deliverable" do
        Deliverable.stub(:find).and_return(mock_deliverable(:update_attributes => true))
        put :update, :id => "1"
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "redirects to the deliverables" do
        Deliverable.stub(:find).and_return(mock_deliverable(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(deliverable_url(mock_deliverable))
      end
    end

    describe "with invalid params" do
      it "updates the requested deliverables" do
        Deliverable.should_receive(:find).with("37").and_return(mock_deliverable)
        mock_deliverable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :deliverable => {:these => 'params'}
      end

      it "assigns the deliverables as @deliverables" do
        Deliverable.stub(:find).and_return(mock_deliverable(:update_attributes => false))
        put :update, :id => "1"
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "re-renders the 'edit' template" do
        Deliverable.stub(:find).and_return(mock_deliverable(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end


  describe "DELETE destroy" do

    it "destroys the requested deliverable" do
      Deliverable.should_receive(:find).with("37").and_return(mock_deliverable)
      @project_phase = mock_model(ProjectPhase)
      mock_deliverable.stub(:project_phase).and_return(@project_phase)
      @project = mock_model(Project)
      @project_phase.stub(:project).and_return(@project)
      mock_deliverable.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the deliverables list" do
      Deliverable.stub(:find).and_return(mock_deliverable(:destroy => true))
      @project_phase = mock_model(ProjectPhase)
      mock_deliverable.stub(:project_phase).and_return(@project_phase)
      @project = mock_model(Project)
      @project_phase.stub(:project).and_return(@project)
      
      
      delete :destroy, :id => "1"
      response.should redirect_to(project_url(@project))
    end
  end
end
