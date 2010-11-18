require 'spec_helper'

describe "/lifecycles/edit.html.erb" do
  include LifecyclesHelper

  before(:each) do
    assigns[:lifecycle] = @lifecycle = stub_model(Lifecycle,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders the edit lifecycle form" do
    render

    response.should have_tag("form[action=#{lifecycle_path(@lifecycle)}][method=post]") do
      with_tag('input#lifecycle_name[name=?]', "lifecycle[name]")
      with_tag('textarea#lifecycle_description[name=?]', "lifecycle[description]")
    end
  end
end
