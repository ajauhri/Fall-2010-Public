Factory.define :xp_deliverable1, :class => Deliverable do |p|
  p.name "Iteration Planning Meeting Minutes"
  p.deliverable_type "Iteration Planning Meeting Minutes"
  p.unit_of_measure "Pages"
  p.complexity "Low"
  p.estimated_size 3
  p.estimated_effort 3

  # This uses association and :lifecycle factory
  p.project_phase_id {|l| l.association(:xp_iteration0) }
end
