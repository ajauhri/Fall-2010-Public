
Factory.define :valid_effort , :class => Effort do |e|
  e.deliverable_id {|l| l.association(:effort_deliverable) }
  e.sequence(:user_id) {|n| n}
  e.value 5.0
end

Factory.define :invalid_value , :class => Effort do |e|
  e.deliverable_id {|l| l.association(:effort_deliverable) }
  e.sequence(:user_id) {|n| n}
  e.value 'Number'
end

Factory.define :invalid_deliverable , :class => Effort do |e|
  e.sequence(:user_id) {|n| n}
  e.value 5.0
end

Factory.define :d1_e1, :class => Effort do |e|
  e.deliverable_id {|l| l.association(:effort_deliverable) }
  e.user_id 1
  e.value 4.0
end

Factory.define :d1_e2, :class => Effort do |e|
  e.deliverable_id {|l| l.association(:effort_deliverable) }
  e.user_id 2
  e.value 8.0
end

Factory.define :negative_effort_value, :class => Effort do |e|
  e.deliverable_id {|l| l.association(:effort_deliverable) }
  e.user_id 2
  e.value -1.0
end

Factory.define :effort_project, :class => Project do |p|
  p.name "Effort Project"
  p.lifecycle_id 10
end

Factory.define :effort_project_phase, :class => ProjectPhase do |p|
  p.project_id {|l| l.association(:effort_project) }
end

Factory.define :effort_deliverable, :class => Deliverable do |p|
  p.name "Requirements Document"
  p.deliverable_type "Requirements Document"
  p.unit_of_measure "Pages"
  p.complexity "HIGH"
  p.actual_size 6
  p.actual_effort 6
  p.actual_production_rate 6
  p.estimated_size 3
  p.estimated_effort 3
  p.project_phase_id {|l| l.association(:effort_project_phase) }
end

Factory.define :testing_total_effort, :class => Effort do |p|
  p.value 10
  p.deliverable_id {|l| l.association(:effort_deliverable) }
end


  

