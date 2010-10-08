require 'spec_helper'

describe "/lifecycle_phases/edit.html.erb" do
  include LifecyclePhasesHelper
=begin
  before(:each) do
    assigns[:lifecycle_phase] = @lifecycle_phase = stub_model(LifecyclePhase,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :sequence => 1
    )
  end

  it "renders the edit lifecycle_phase form" do
    render

    response.should have_tag("form[action=#{lifecycle_phase_path(@lifecycle_phase)}][method=post]") do
      with_tag('input#lifecycle_phase_name[name=?]', "lifecycle_phase[name]")
      with_tag('textarea#lifecycle_phase_description[name=?]', "lifecycle_phase[description]")
      with_tag('input#lifecycle_phase_sequence[name=?]', "lifecycle_phase[sequence]")
    end
  end
=end
end
