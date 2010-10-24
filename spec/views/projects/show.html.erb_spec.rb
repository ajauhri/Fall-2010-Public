require 'spec_helper'




describe "/projects/show.html.erb" do
  before(:all) do
    User.delete_all
    login_user
    @lifecycle = Factory.create(:lifecycle)
    @project_phases = []
    @iteration0 = Factory.create(:xp_iteration0)
    #@project_phases << iteration0
  end

 before(:each) do
   @project = Factory.create(:project)
 end


  it "renders attributes in <ul>" do
    render :partial => "/project_phases/project_phase", :locals => {:project_phase => @iteration0}
    get "/projects/show/#{@project.id}"
    response.should render_template('show')
    response.should have_tag('table') 
    # do
    #       with_tag('li', 'Iteration Planning Meeting Minutes')
    #     end
    
  end
end

