class Project < ActiveRecord::Base

  belongs_to :lifecyle
  validates_presence_of :name
  STATUS_TYPES = [
    ["Active"], #"active"],
    ["Archived"], #"archived"],
    ["Deleted"]#, "deleted"]
  ]

  #validates_inclusion_of :status, :in =>
  #  STATUS_TYPES.map{|disp, value| value}
end
