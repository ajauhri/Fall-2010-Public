class Project < ActiveRecord::Base
  after_create :create_phases
  belongs_to :lifecyle
  has_many :project_phases, :order => "sequence"
  validates_presence_of :name, :lifecycle_id
  
  STATUS_TYPES = [
    ["Active"], #"active"],
    ["Archived"], #"archived"],
    ["Deleted"]#, "deleted"]
  ]

def create_phases
   @lifecycle_phases = LifecyclePhase.find_all_by_lifecycle_id(self.lifecycle_id)
   @lifecycle_phases.each do |lp|
     
       ProjectPhases.create(
         :name => lp.name,
         :description => lp.description,
         :lifecycle_phase => lp,
         :sequence => lp.sequence,
         :project => self)
   end
 end


  #validates_inclusion_of :status, :in =>
  #  STATUS_TYPES.map{|disp, value| value}
end
