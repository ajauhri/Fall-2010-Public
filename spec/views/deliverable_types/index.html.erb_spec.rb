require 'spec_helper'

describe "/deliverable_types/index.html.erb" do
  include DeliverableTypesHelper

  before(:each) do
    assigns[:deliverable_types] = [
      stub_model(DeliverableType,
        :name => "value for name",
        :unit_of_measure => "value for unit_of_measure"
      ),
      stub_model(DeliverableType,
        :name => "value for name",
        :unit_of_measure => "value for unit_of_measure"
      )
    ]
  end

  it "renders a list of deliverable_types" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for unit_of_measure".to_s, 2)
  end
end
