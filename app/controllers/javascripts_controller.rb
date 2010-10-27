class JavascriptsController < ApplicationController

  def dynamic_estimates
    @estimates = []
    deliverable_types = DeliverableType.find(:all)
    for deliverable_type in deliverable_types
      for complexity in Complexity::VALUES
        @estimates << Deliverable.get_estimates(deliverable_type.name, complexity)
      end
    end
    puts '================='
    puts @estimates
    puts '================'
  end

end
