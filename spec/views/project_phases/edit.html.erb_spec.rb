require 'spec_helper'

describe "/project_phases/edit.html.erb" do
  include ProjectPhasesHelper

  before(:each) do
    assigns[:project_phase] = @project_phase = stub_model(ProjectPhases,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :sequence => 1,
      :total_estimated_effort => 9.99
    )
  end

  it "renders the edit project_phases form" do
    render

    response.should have_tag("form[action=#{project_phase_path(@project_phase)}][method=post]") do
      with_tag('input#project_phases_name[name=?]', "project_phases[name]")
      with_tag('textarea#project_phases_description[name=?]', "project_phases[description]")
      with_tag('input#project_phases_sequence[name=?]', "project_phases[sequence]")
      with_tag('input#project_phases_total_estimated_effort[name=?]', "project_phases[total_estimated_effort]")
    end
  end
end
