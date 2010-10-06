require 'spec_helper'

describe "/project_phases/new.html.erb" do
  include ProjectPhasesHelper

  before(:each) do
    assigns[:project_phases] = stub_model(ProjectPhases,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :sequence => 1,
      :total_estimated_effort => 9.99
    )
  end

  it "renders new project_phases form" do
    render

    response.should have_tag("form[action=?][method=post]", project_phases_path) do
      with_tag("input#project_phases_name[name=?]", "project_phases[name]")
      with_tag("textarea#project_phases_description[name=?]", "project_phases[description]")
      with_tag("input#project_phases_sequence[name=?]", "project_phases[sequence]")
      with_tag("input#project_phases_total_estimated_effort[name=?]", "project_phases[total_estimated_effort]")
    end
  end
end
