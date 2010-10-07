require 'spec_helper'

describe "/project_phases/index.html.erb" do
  include ProjectPhasesHelper

  before(:each) do
    assigns[:project_phases] = [
      stub_model(ProjectPhase,
        :name => "value for name",
        :description => "value for description",
        :sequence => 1,
        :total_estimated_effort => 9.99
      ),
      stub_model(ProjectPhase,
        :name => "value for name",
        :description => "value for description",
        :sequence => 1,
        :total_estimated_effort => 9.99
      )
    ]
  end

  it "renders a list of project_phases" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end
