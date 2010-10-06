class AddTestDataForLifecyclePhases < ActiveRecord::Migration
  def self.up
    LifecyclePhase.delete_all

    xp_lifecycle = Lifecycle.find_by_name("XP")
    LifecyclePhase.create(:name => "Iteration 0", :lifecycle => xp_lifecycle,
          :sequence => 1, :description => "Planning iteration 0")

    LifecyclePhase.create(:name => "Iteration 1", :lifecycle => xp_lifecycle,
          :sequence => 2, :description => "Planning iteration 1")

   LifecyclePhase.create(:name => "Iteration 2", :lifecycle => xp_lifecycle,
          :sequence => 3, :description => "Planning iteration 2")

    waterfall_lifecycle = Lifecycle.find_by_name("Simplified Waterfall")

    LifecyclePhase.create(:name => "System Concept", :lifecycle => waterfall_lifecycle,
          :sequence => 1, :description => "System Definition")

    LifecyclePhase.create(:name => "System Requirements", :lifecycle => waterfall_lifecycle,
          :sequence => 2, :description => "System Requirements")

    LifecyclePhase.create(:name => "System Design", :lifecycle => waterfall_lifecycle,
          :sequence => 3, :description => "System Design")
  end

  def self.down
    LifecyclePhase.delete_all

  end
end
