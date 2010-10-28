require 'spec_helper'

describe JavascriptsController do

   def mock_deliverable_type(stubs={})
    mock_model(DeliverableType, stubs)
  end
  
  it "should get dynamic estimates array" do
    
    Complexity.stub!(:getValues).and_return( ["Low","Medium","High"])
    deliverable_type1 = mock_deliverable_type(:name => "Deliverable1")
    deliverable_type2 = mock_deliverable_type(:name => "Deliverable2")
    DeliverableType.stub!(:find).with(:all).and_return([deliverable_type1, deliverable_type2])
    Deliverable.should_receive(:get_estimates).with(any_args()).exactly(6).times
    estimates = controller.dynamic_estimates
    estimates.should == [deliverable_type1,deliverable_type2]
            
        
  end
end
  