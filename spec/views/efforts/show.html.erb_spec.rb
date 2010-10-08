require 'spec_helper'

describe "/efforts/show.html.erb" do
  include EffortsHelper
=begin
  before(:each) do
    assigns[:effort] = @effort = stub_model(Effort,
      :value => 1.5,
      :username => "value for username"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1\.5/)
    response.should have_text(/value\ for\ username/)
  end
=end
end
