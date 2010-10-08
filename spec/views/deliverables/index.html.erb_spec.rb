require 'spec_helper'

describe "/deliverables/index.html.erb" do
  include DeliverablesHelper

=begin
  before(:each) do
    assigns[:deliverables] = [
      stub_model(Deliverable,
        :name => "value for name",
        :description => "value for description",
        :est_effort => 1.5
      ),
      stub_model(Deliverable,
        :name => "value for name",
        :description => "value for description",
        :est_effort => 1.5
      )
    ]
  end

  it "renders a list of deliverables" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 1.5.to_s, 2)
  end
=end
end
