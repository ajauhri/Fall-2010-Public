require 'spec_helper'

describe "/deliverables/new.html.erb" do
  include DeliverablesHelper

  before(:each) do
    assigns[:deliverables] = stub_model(Deliverable,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :est_effort => 1.5
    )
  end

  it "renders new deliverables form" do
    render

    response.should have_tag("form[action=?][method=post]", deliverables_path) do
      with_tag("input#deliverables_name[name=?]", "deliverables[name]")
      with_tag("textarea#deliverables_description[name=?]", "deliverables[description]")
      with_tag("input#deliverables_est_effort[name=?]", "deliverables[est_effort]")
    end
  end
end
