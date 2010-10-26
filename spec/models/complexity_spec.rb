require 'spec_helper'

describe Complexity do

  it "should not include blah" do
    Complexity::VALUES.should_not include('blah')
  end
end
