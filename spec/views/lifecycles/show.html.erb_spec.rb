require 'spec_helper'

describe "/lifecycles/show.html.erb" do
  include LifecyclesHelper
  before(:each) do
    assigns[:lifecycle] = @lifecycle = stub_model(Lifecycle,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end
