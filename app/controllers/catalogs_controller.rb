class CatalogsController < ApplicationController

  before_filter :only_admin
  def index
    @deliverable_types = DeliverableType.all
    @lifecycle_phases = LifecyclePhase.all
    @lifecycles = Lifecycle.all
    @typical_deliverables = TypicalDeliverable.all
    @users = User.all
  end

end
