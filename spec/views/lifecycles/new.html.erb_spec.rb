require 'spec_helper'

describe "/lifecycles/new.html.erb" do
  include LifecyclesHelper

  before(:each) do
    assigns[:lifecycle] = stub_model(Lifecycle,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders new lifecycle form" do
    render

    response.should have_tag("form[action=?][method=post]", lifecycles_path) do
      with_tag("input#lifecycle_name[name=?]", "lifecycle[name]")
      with_tag("textarea#lifecycle_description[name=?]", "lifecycle[description]")
    end
  end
end
