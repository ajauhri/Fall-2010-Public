class AddTestDataLifecycles < ActiveRecord::Migration
  def self.up
    Lifecycle.delete_all

    Lifecycle.create(
    :name => "Simplified Waterfall",
    :description => "Legacy software development methodology"
    )

    Lifecycle.create(
    :name => "XP",
    :description => "New Agile methodology for software development"
    )


  end

  def self.down
    Lifecycle.delete_all
  end
end
