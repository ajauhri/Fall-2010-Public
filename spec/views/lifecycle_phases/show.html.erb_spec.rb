require 'spec_helper'

describe "/lifecycle_phases/show.html.erb" do
  include LifecyclePhasesHelper
  before(:each) do
    assigns[:lifecycle_phase] = @lifecycle_phase = stub_model(LifecyclePhase,
      :name => "value for name",
      :description => "value for description",
      :sequence => 1
    )
  end

=begin
  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1/)
  end
=end
end
