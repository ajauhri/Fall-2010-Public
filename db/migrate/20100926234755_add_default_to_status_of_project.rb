class AddDefaultToStatusOfProject < ActiveRecord::Migration
  def self.up
    # TO-DO :  Find a way to provide a value using STATUS_TYPES array. Refer to Pg. 700
    change_column_default(Project, :status, "Active")
  end

  def self.down
  end
end
