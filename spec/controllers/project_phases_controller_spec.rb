require 'spec_helper'

describe ProjectPhasesController do
  before(:each) do
    login_user
  end

  after(:each) do
    logout_user
  end

  def mock_project_phase(stubs={})
    @mock_project_phase ||= mock_model(ProjectPhase, stubs)
  end

    def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
  end

   def stub_project
      mock_project_phase.stub(:project).and_return(mock_project)
   end


=begin
  describe "GET index" do
    it "assigns all project_phase as @project_phase" do
      ProjectPhase.stub(:find).with(:all).and_return([mock_project_phase])
      get :index
      assigns[:project_phase].should == [mock_project_phase]
    end
  end
=end

  describe "GET show" do
    it "assigns the requested project_phase as @project_phase" do
      ProjectPhase.stub(:find).with("37").and_return(mock_project_phase)
      get :show, :id => "37"
      assigns[:project_phase].should equal(mock_project_phase)
    end
  end


  describe "GET new" do
    it "assigns a new project_phase as @project_phase" do
      ProjectPhase.stub(:new).and_return(mock_project_phase)
      
      get :new
      assigns[:project_phase].should equal(mock_project_phase)
    end
  end

  describe "GET edit" do
    it "assigns the requested project_phase as @project_phase" do
      ProjectPhase.stub(:find).with("37").and_return(mock_project_phase)
      get :edit, :id => "37"
      assigns[:project_phase].should equal(mock_project_phase)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created project_phase as @project_phase" do
        ProjectPhase.stub(:new).with({'these' => 'params'}).and_return(mock_project_phase(:save => true))
        stub_project
        mock_project_phase.stub(:project_id).and_return(mock_project.id)
        post :create, :project_phase => {:these => 'params'}
        assigns[:project_phase].should equal(mock_project_phase)
      end

      it "redirects to the project" do
        ProjectPhase.stub(:new).and_return(mock_project_phase(:save => true))
        stub_project
        mock_project_phase.stub(:project_id).and_return(mock_project.id)
        post :create, :project_phase => {}

        #ProjectPhase.stub(:find_all_by_project_id)
        #@project_phases = ProjectPhase.find_all_by_project_id(@project_phase.project_id, :order => :sequence)
        response.should render_template("project_phases/_")
      end
      
      
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project_phase as @project_phase" do
                 ProjectPhase.stub(:new).with({'these' => 'params'}).and_return(mock_project_phase(:save => false))
                 post :create, :project_phase => {:these => 'params'}
                 assigns[:project_phase].should equal(mock_project_phase)
               end
         
      it "re-renders the 'new' template" do
        ProjectPhase.stub(:new).and_return(mock_project_phase(:save => false))
        post :create, :project_phase => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested project_phase" do
        ProjectPhase.should_receive(:find).with("37").and_return(mock_project_phase)
        mock_project_phase.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :project_phase => {:these => 'params'}
      end

      it "assigns the requested project_phase as @project_phase" do
        ProjectPhase.stub(:find).and_return(mock_project_phase(:update_attributes => true))
        stub_project
        put :update, :id => "1"
        assigns[:project_phase].should equal(mock_project_phase)
      end

      it "redirects to the project" do
        ProjectPhase.stub(:find).and_return(mock_project_phase(:update_attributes => true))
        stub_project
        put :update, :id => "1"
        response.should redirect_to(project_url(mock_project))
      end
      
      it "should redirect to show template if params commit is present" do
        ProjectPhase.stub(:find).with(any_args()).and_return(mock_project_phase)
        @mock_project_phase.should_receive(:project).and_return(mock_project)
        put :update, :commit => "Cancel"
        response.should redirect_to(project_url(@mock_project))
      end
    end

    describe "with invalid params" do
      it "updates the requested project_phase" do
        ProjectPhase.should_receive(:find).with("37").and_return(mock_project_phase)
        mock_project_phase.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :project_phase => {:these => 'params'}
      end

      it "assigns the project_phase as @project_phase" do
        ProjectPhase.stub(:find).and_return(mock_project_phase(:update_attributes => false))
        put :update, :id => "1"
        assigns[:project_phase].should equal(mock_project_phase)
      end

      it "re-renders the 'edit' template" do
        ProjectPhase.stub(:find).and_return(mock_project_phase(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested project_phase" do
      ProjectPhase.should_receive(:find).with("37").and_return(mock_project_phase)
      stub_project
      mock_project_phase.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the project_phase list" do
      ProjectPhase.stub(:find).and_return(mock_project_phase(:destroy => true))
      stub_project
      delete :destroy, :id => "1"
      response.should redirect_to(project_url(mock_project))
    end
  end
  
end
