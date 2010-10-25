require 'spec_helper'

describe "/deliverable_types/new.html.erb" do
  include DeliverableTypesHelper

  before(:each) do
    assigns[:deliverable_type] = stub_model(DeliverableType,
      :new_record? => true,
      :name => "value for name",
      :unit_of_measure => "value for unit_of_measure"
    )
  end

  it "renders new deliverable_type form" do
    render

    response.should have_tag("form[action=?][method=post]", deliverable_types_path) do
      with_tag("input#deliverable_type_name[name=?]", "deliverable_type[name]")
      with_tag("input#deliverable_type_unit_of_measure[name=?]", "deliverable_type[unit_of_measure]")
    end
  end
end
