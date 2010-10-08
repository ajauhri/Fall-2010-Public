require 'spec_helper'

describe "/lifecycle_phases/new.html.erb" do
  include LifecyclePhasesHelper
=begin
  before(:each) do
    assigns[:lifecycle_phase] = stub_model(LifecyclePhase,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :sequence => 1
    )
  end

  it "renders new lifecycle_phase form" do
    render

    response.should have_tag("form[action=?][method=post]", lifecycle_phases_path) do
      with_tag("input#lifecycle_phase_name[name=?]", "lifecycle_phase[name]")
      with_tag("textarea#lifecycle_phase_description[name=?]", "lifecycle_phase[description]")
      with_tag("input#lifecycle_phase_sequence[name=?]", "lifecycle_phase[sequence]")
    end
  end
=end
end
