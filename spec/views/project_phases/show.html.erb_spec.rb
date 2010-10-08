require 'spec_helper'

describe "/project_phases/show.html.erb" do
  include ProjectPhasesHelper
  before(:each) do
    assigns[:project_phases] = @project_phases = stub_model(ProjectPhase,
      :name => "value for name",
      :description => "value for description",
      :sequence => 1,
      :total_estimated_effort => 9.99
    )
  end


=begin
it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
  end
=end
  
end
