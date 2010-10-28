class JavascriptsController < ApplicationController

  def dynamic_estimates
    
    @estimates = []
    @complexity_values=Complexity.getValues
    @deliverable_types = DeliverableType.find(:all)
    for deliverable_type in @deliverable_types
      for complexity in @complexity_values
        @estimates << Deliverable.get_estimates(deliverable_type.name, complexity)
      end
    end
  end

end
