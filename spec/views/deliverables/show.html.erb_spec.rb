require 'spec_helper'

describe "/deliverables/show.html.erb" do
  include DeliverablesHelper
  before(:each) do
    assigns[:deliverables] = @deliverables = stub_model(Deliverable,
      :name => "value for name",
      :description => "value for description",
      :est_effort => 1.5
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/1\.5/)
  end
end
