Factory.define :xp_deliverable1, :class => Deliverable do |p|
  p.name "Iteration Planning Meeting Minutes"
  p.deliverable_type "Iteration Planning Meeting Minutes"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2

  # This uses association and :lifecycle factory
  p.project_phase {|l| l.association(:xp_iteration0) }
end

Factory.define :low_complex_minutes1, :class => Deliverable do |p|
  p.name "Iteration Planning Meeting Minutes"
  p.deliverable_type "Iteration Planning Meeting Minutes"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.actual_size 1
  p.actual_effort 1
  p.actual_production_rate 1
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:archived_project_phase) }
end

Factory.define :low_complex_minutes2, :class => Deliverable do |p|
  p.name "Iteration Planning Meeting Minutes"
  p.deliverable_type "Iteration Planning Meeting Minutes"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.actual_size 3
  p.actual_effort 3
  p.actual_production_rate 3
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:archived_project_phase) }
end

Factory.define :low_complex_minutes3, :class => Deliverable do |p|
  p.name "Iteration Planning Meeting Minutes"
  p.deliverable_type "Iteration Planning Meeting Minutes"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.actual_size 5
  p.actual_effort 5
  p.actual_production_rate 5
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:archived_project_phase) }
end


Factory.define :high_complex_requirements1, :class => Deliverable do |p|
  p.name "Requirements Document"
  p.deliverable_type "Requirements Document"
  p.unit_of_measure "Pages"
  p.complexity "HIGH"
  p.actual_size 2
  p.actual_effort 2
  p.actual_production_rate 2
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:archived_project_phase) }
end

Factory.define :high_complex_requirements2, :class => Deliverable do |p|
  p.name "Requirements Document"
  p.deliverable_type "Requirements Document"
  p.unit_of_measure "Pages"
  p.complexity "HIGH"
  p.actual_size 4
  p.actual_effort 4
  p.actual_production_rate 4
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:archived_project_phase) }
end

Factory.define :high_complex_requirements3, :class => Deliverable do |p|
  p.name "Requirements Document"
  p.deliverable_type "Requirements Document"
  p.unit_of_measure "Pages"
  p.complexity "HIGH"
  p.actual_size 6
  p.actual_effort 6
  p.actual_production_rate 6
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:archived_project_phase) }
end

Factory.define :effort_deliverable, :class => Deliverable do |p|
  p.name "Document"
  p.deliverable_type "Document"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.estimated_size 3
  p.estimated_effort 3
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:effort_project_phase) }
end

Factory.define :effort_deliverable2, :class => Deliverable do |p|
  p.name "Document2"
  p.deliverable_type "Document2"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.estimated_size 3
  p.estimated_effort 30
  p.estimated_production_rate 2
  p.project_phase {|l| l.association(:effort_project_phase) }
end