require 'spec_helper'

describe "/typical_deliverables/index.html.erb" do
  include TypicalDeliverablesHelper

  before(:each) do
    expected_typical_deliverables = [ stub_model(TypicalDeliverable), stub_model(TypicalDeliverable)]

    expected_typical_deliverables.each do |typical_deliverable|
      typical_deliverable.stub(:get_production_rate)
      typical_deliverable.stub(:deliverable_type).and_return(stub_model(DeliverableType))
      typical_deliverable.stub(:lifecycle_phase).and_return(stub_model(LifecyclePhase))

    end
    assigns[:typical_deliverables] = expected_typical_deliverables

  end


  it "renders a list of typical_deliverables" do
    render
  end
end
