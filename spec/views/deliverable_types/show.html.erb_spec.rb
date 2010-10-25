require 'spec_helper'

describe "/deliverable_types/show.html.erb" do
  include DeliverableTypesHelper
  before(:each) do
    assigns[:deliverable_type] = @deliverable_type = stub_model(DeliverableType,
      :name => "value for name",
      :unit_of_measure => "value for unit_of_measure"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ unit_of_measure/)
  end
end
