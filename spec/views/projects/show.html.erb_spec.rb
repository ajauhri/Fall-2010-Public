require 'spec_helper'

describe "/projects/show.html.erb" do
 
  def mock_project(stubs={})
    @mock_project ||= mock_model(Project, stubs)
  end


 before(:each) do
    @mock_project ||= stub_model(Project,
       :id => 4,
       :name => 'Project',
       :lifecycle_id => 3)
     @mock_phase ||= stub_model(ProjectPhase, 
       :id => 4,
       :project_id => 4)
     @mock_deliverable ||= stub_model(Deliverable,
       :name => 'DeliverableName',
       :deliverable_type => "DeliverableType",
       :unit_of_measure => "UOM",
       :complexity => 'Complexity',
       :estimated_size => 100,
       :estimated_effort => 100,
       :project_phase_id => 4)
 end


  it "renders attributes in <ul>" do
    #controller.stub!(:current_user).and_return(mock_project())
    #controller.stub!(:current_user).and_return(mock_project)
    #mock_project.should_receive(:name)
    
    render "projects/show" , :object => @mock_project}
    
    #get :show, :id => 4
    
    # render :partial => "/project_phases/project_phase", :locals => {:project_phase => @iteration0}
    #     get "/projects/show/#{@project.id}"
         response.should render_template('show')
    #     response.should have_tag('table') 
    #     # do
    #       with_tag('li', 'Iteration Planning Meeting Minutes')
    #     end
    
  end

end

