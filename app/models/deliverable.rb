class Deliverable < ActiveRecord::Base
  belongs_to :project_phase
  has_many :efforts
end
