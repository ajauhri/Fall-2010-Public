require 'spec_helper'

describe JavascriptsController do

  def mock_deliverables(stubs={})
    @mock_deliverables ||= mock_model(Deliverable, stubs)
  end

   def mock_deliverable_types(stubs={})
    @mock_deliverable_types ||= mock_model(DeliverableType, stubs)
  end

  it "should get dynamic estimates array" do
    DeliverableType.stub(:find).with(:all).and_return([mock_deliverable_types])
    Deliverable.stub(:get_estimates).with().and_return({:est_effort => 1})
    get :dynamic_estimates
    assigns[:estimates].length.should equal(1)
  end
end
  