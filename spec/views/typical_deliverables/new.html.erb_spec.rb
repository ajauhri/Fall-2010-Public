require 'spec_helper'

describe "/typical_deliverables/new.html.erb" do
  include TypicalDeliverablesHelper

  before(:each) do
    assigns[:typical_deliverable] = stub_model(TypicalDeliverable,
      :new_record? => true
    )
  end

  it "renders new typical_deliverable form" do
    render

    response.should have_tag("form[action=?][method=post]", typical_deliverables_path) do
    end
  end
end
