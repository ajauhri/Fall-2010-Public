require 'spec_helper'




describe "/projects/show.html.erb" do
  before(:all) do
    User.delete_all
    login_user
    @lifecycle = Factory.create(:lifecycle)
    @project_phases = []
    iteration0 = Factory.create(:xp_iteration0)
    @project_phases << iteration0
  end

 # before(:each) do
 #   @project = stub(Project,
 #     :name => "Project 1",
 #     :description => "value for description",
 #     :sequence => 1,
 #     :lifecycle_id => @lifecycle.id)
 # end


  it "renders attributes in <ul>" do
    render :partial => "/phases/project_phase", :locals => {:project_phases => @project_phases}
    response.should have_tag('ul') do
      with_tag('li', 'Iteration Planning Meeting Minutes')
    end

  end
end

