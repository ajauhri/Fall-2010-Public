require 'spec_helper'

describe "/efforts/index.html.erb" do
  include EffortsHelper

=begin
  before(:each) do
    assigns[:efforts] = [
      stub_model(Effort,
        :value => 1.5,
        :username => "value for username"
      ),
      stub_model(Effort,
        :value => 1.5,
        :username => "value for username"
      )
    ]
  end

  it "renders a list of efforts" do
    render
    response.should have_tag("tr>td", 1.5.to_s, 2)
    response.should have_tag("tr>td", "value for username".to_s, 2)
  end
=end
end
