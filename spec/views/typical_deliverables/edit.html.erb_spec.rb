require 'spec_helper'

describe "/typical_deliverables/edit.html.erb" do
  include TypicalDeliverablesHelper

  before(:each) do
    assigns[:typical_deliverable] = @typical_deliverable = stub_model(TypicalDeliverable,
      :new_record? => false
    )
  end

  it "renders the edit typical_deliverable form" do
    render

    response.should have_tag("form[action=#{typical_deliverable_path(@typical_deliverable)}][method=post]") do
    end
  end
end
