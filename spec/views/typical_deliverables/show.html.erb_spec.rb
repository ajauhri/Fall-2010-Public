require 'spec_helper'

describe "/typical_deliverables/show.html.erb" do
  include TypicalDeliverablesHelper
  before(:each) do
    assigns[:typical_deliverable] = @typical_deliverable = stub_model(TypicalDeliverable)
  end

  it "renders attributes in <p>" do
    render
  end
end
