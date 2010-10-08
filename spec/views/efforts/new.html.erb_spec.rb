require 'spec_helper'

describe "/efforts/new.html.erb" do
  include EffortsHelper

=begin
  before(:each) do
    assigns[:effort] = stub_model(Effort,
      :new_record? => true,
      :value => 1.5,
      :username => "value for username"
    )
  end

  it "renders new effort form" do
    render

    response.should have_tag("form[action=?][method=post]", efforts_path) do
      with_tag("input#effort_value[name=?]", "effort[value]")
      with_tag("input#effort_username[name=?]", "effort[username]")
    end
  end
=end
end
