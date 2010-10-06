require 'spec_helper'

describe ProjectPhasesController do

  def mock_project_phases(stubs={})
    @mock_project_phases ||= mock_model(ProjectPhases, stubs)
  end

  describe "GET index" do
    it "assigns all project_phases as @project_phases" do
      ProjectPhases.stub(:find).with(:all).and_return([mock_project_phases])
      get :index
      assigns[:project_phases].should == [mock_project_phases]
    end
  end

  describe "GET show" do
    it "assigns the requested project_phases as @project_phases" do
      ProjectPhases.stub(:find).with("37").and_return(mock_project_phases)
      get :show, :id => "37"
      assigns[:project_phases].should equal(mock_project_phases)
    end
  end

  describe "GET new" do
    it "assigns a new project_phases as @project_phases" do
      ProjectPhases.stub(:new).and_return(mock_project_phases)
      get :new
      assigns[:project_phases].should equal(mock_project_phases)
    end
  end

  describe "GET edit" do
    it "assigns the requested project_phases as @project_phases" do
      ProjectPhases.stub(:find).with("37").and_return(mock_project_phases)
      get :edit, :id => "37"
      assigns[:project_phases].should equal(mock_project_phases)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created project_phases as @project_phases" do
        ProjectPhases.stub(:new).with({'these' => 'params'}).and_return(mock_project_phases(:save => true))
        post :create, :project_phases => {:these => 'params'}
        assigns[:project_phases].should equal(mock_project_phases)
      end

      it "redirects to the created project_phases" do
        ProjectPhases.stub(:new).and_return(mock_project_phases(:save => true))
        post :create, :project_phases => {}
        response.should redirect_to(project_phase_url(mock_project_phases))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project_phases as @project_phases" do
        ProjectPhases.stub(:new).with({'these' => 'params'}).and_return(mock_project_phases(:save => false))
        post :create, :project_phases => {:these => 'params'}
        assigns[:project_phases].should equal(mock_project_phases)
      end

      it "re-renders the 'new' template" do
        ProjectPhases.stub(:new).and_return(mock_project_phases(:save => false))
        post :create, :project_phases => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested project_phases" do
        ProjectPhases.should_receive(:find).with("37").and_return(mock_project_phases)
        mock_project_phases.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :project_phases => {:these => 'params'}
      end

      it "assigns the requested project_phases as @project_phases" do
        ProjectPhases.stub(:find).and_return(mock_project_phases(:update_attributes => true))
        put :update, :id => "1"
        assigns[:project_phases].should equal(mock_project_phases)
      end

      it "redirects to the project_phases" do
        ProjectPhases.stub(:find).and_return(mock_project_phases(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(project_phase_url(mock_project_phases))
      end
    end

    describe "with invalid params" do
      it "updates the requested project_phases" do
        ProjectPhases.should_receive(:find).with("37").and_return(mock_project_phases)
        mock_project_phases.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :project_phases => {:these => 'params'}
      end

      it "assigns the project_phases as @project_phases" do
        ProjectPhases.stub(:find).and_return(mock_project_phases(:update_attributes => false))
        put :update, :id => "1"
        assigns[:project_phases].should equal(mock_project_phases)
      end

      it "re-renders the 'edit' template" do
        ProjectPhases.stub(:find).and_return(mock_project_phases(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested project_phases" do
      ProjectPhases.should_receive(:find).with("37").and_return(mock_project_phases)
      mock_project_phases.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the project_phases list" do
      ProjectPhases.stub(:find).and_return(mock_project_phases(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(project_phases_url)
    end
  end

end
