require 'spec_helper'

describe "/efforts/edit.html.erb" do
  include EffortsHelper

  before(:each) do
    assigns[:effort] = @effort = stubs(Effort,
      :new_record? => false,
      :value => 1.5,
      :username => "value for username"
    )
  end


=begin
it "renders the edit effort form" do
    render

    response.should have_tag("form[action=#{effort_path(@effort)}][method=post]") do
      with_tag('input#effort_value[name=?]', "effort[value]")
      with_tag('input#effort_username[name=?]', "effort[username]")
    end
  end
=end
  
end
