Factory.define :xp_iteration0, :class => ProjectPhase do |p|
  p.name "Iteration 0"

  # This uses association and :lifecycle factory
  p.project_id {|l| l.association(:project) }
end


Factory.define :archived_project_phase, :class => ProjectPhase do |p|
  p.name "Archived"

  # This uses association and :lifecycle factory
  p.project {|l| l.association(:archived_project) }
end




Factory.define :project_phase, :class => Project do |p|
  p.name "Project_phase"
  p.lifecycle_id 9
end


Factory.define :lifecycle_phase, :class => LifecyclePhase do |p|
    p.name "Lifecycle_phase"
   
end



#Factories before testing the after_save method create_deliverables in ProjectPhase

Factory.define :typical_deliverable1_project_phase, :class => TypicalDeliverable do |p|
  p.name "Typical Deliverable 1"
  p.complexity "LOW"
  p.estimated_size 3
  p.estimated_effort 3
end

Factory.define :typical_deliverable2_project_phase, :class => TypicalDeliverable do |p|
  p.name "Typical Deliverable 2"
  p.complexity "LOW"
  p.estimated_size 3
  p.estimated_effort 3
end

Factory.define :deliverable_type_project_phase, :class => DeliverableType do |p|
  p.name "Typical Deliverable type for Testing"
  p.unit_of_measure "Hours"
end

Factory.define :project_phase_lifecycle, :class => ProjectPhase do |p|
  p.name "Iteration 0"
end


Factory.define :lifecycle_project_phase, :class => LifecyclePhase do |p|
    p.name "Lifecycle_phase"
   
end
