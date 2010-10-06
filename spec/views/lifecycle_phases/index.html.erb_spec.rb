require 'spec_helper'

describe "/lifecycle_phases/index.html.erb" do
  include LifecyclePhasesHelper

  before(:each) do
    assigns[:lifecycle_phases] = [
      stub_model(LifecyclePhase,
        :name => "value for name",
        :description => "value for description",
        :sequence => 1
      ),
      stub_model(LifecyclePhase,
        :name => "value for name",
        :description => "value for description",
        :sequence => 1
      )
    ]
  end

  it "renders a list of lifecycle_phases" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
