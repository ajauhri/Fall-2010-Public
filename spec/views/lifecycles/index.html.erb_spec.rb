require 'spec_helper'

describe "/lifecycles/index.html.erb" do
  include LifecyclesHelper

  before(:each) do
    assigns[:lifecycles] = [
      stub_model(Lifecycle,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(Lifecycle,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of lifecycles" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
