
Factory.define :valid_effort , :class => Effort do |e|
  e.sequence(:user_id) {|n| n}
  e.sequence(:deliverable_id) {|n| n}
  e.value 5.0
end

Factory.define :invalid_value , :class => Effort do |e|
  e.sequence(:user_id) {|n| n}
  e.sequence(:deliverable_id) {|n| n}
  e.value 'Number'
end

Factory.define :invalid_deliverable , :class => Effort do |e|
  e.sequence(:user_id) {|n| n}
  e.value 5.0
end

Factory.define :d1_e1, :class => Effort do |e|
  e.user_id 1
  e.sequence(:deliverable_id) {|n| n}
  e.value 4.0
end

Factory.define :d1_e2, :class => Effort do |e|
  e.user_id 2
  e.sequence(:deliverable_id) {|n| n}
  e.value 8.0
end

Factory.define :negative_effort_value, :class => Effort do |e|
  e.user_id 2
  e.sequence(:deliverable_id) {|n| n}
  e.value -1.0
end

Factory.define :effort_project, :class => Project do |p|
  p.name "Effort Project"
  p.lifecycle_id 10

end

Factory.define :effort_project_phase, :class => ProjectPhase do |p|
  p.project {|l| l.association(:effort_project) }
end

Factory.define :effort_deliverable, :class => Deliverable do |p|
  p.name "Document"
  p.deliverable_type "Document"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.estimated_size 3
  p.estimated_effort 3
  p.project_phase {|l| l.association(:effort_project_phase) }
end

Factory.define :effort_deliverable2, :class => Deliverable do |p|
  p.name "Document2"
  p.deliverable_type "Document2"
  p.unit_of_measure "Pages"
  p.complexity "LOW"
  p.estimated_size 3
  p.estimated_effort 30
  p.project_phase {|l| l.association(:effort_project_phase) }
end

Factory.define :effort1, :class => Effort do |p|
  p.user_id 4
  p.value 10
  p.deliverable {|l| l.association(:effort_deliverable) }
end

Factory.define :effort2, :class => Effort do |p|
  p.user_id 47
  p.value 15
end


  


  

