require 'spec_helper'

describe "/typical_deliverables/index.html.erb" do
  include TypicalDeliverablesHelper

  before(:each) do
    assigns[:typical_deliverables] = [
      stub_model(TypicalDeliverable),
      stub_model(TypicalDeliverable)
    ]
  end

  it "renders a list of typical_deliverables" do
    render
  end
end
