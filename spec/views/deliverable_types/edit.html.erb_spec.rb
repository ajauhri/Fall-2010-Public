require 'spec_helper'

describe "/deliverable_types/edit.html.erb" do
  include DeliverableTypesHelper

  before(:each) do
    assigns[:deliverable_type] = @deliverable_type = stub_model(DeliverableType,
      :new_record? => false,
      :name => "value for name",
      :unit_of_measure => "value for unit_of_measure"
    )
  end

  it "renders the edit deliverable_type form" do
    render

    response.should have_tag("form[action=#{deliverable_type_path(@deliverable_type)}][method=post]") do
      with_tag('input#deliverable_type_name[name=?]', "deliverable_type[name]")
      with_tag('input#deliverable_type_unit_of_measure[name=?]', "deliverable_type[unit_of_measure]")
    end
  end
end
