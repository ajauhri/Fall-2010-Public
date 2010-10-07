
Factory.define :valid_effort , :class => Effort do |e|
  e.sequence(:deliverable_id) {|n| n}
  e.sequence(:user_id) {|n| n}
  e.value 5.0
end

Factory.define :invalid_value , :class => Effort do |e|
  e.sequence(:deliverable_id) {|n| n}
  e.sequence(:user_id) {|n| n}
  e.value 'Number'
end

Factory.define :invalid_deliverable , :class => Effort do |e|
  e.sequence(:user_id) {|n| n}
  e.value 5.0
end

Factory.define :d1_e1, :class => Effort do |e|
  e.deliverable_id 7
  e.user_id 1
  e.value 4.0
end

Factory.define :d1_e2, :class => Effort do |e|
  e.deliverable_id 7
  e.user_id 2
  e.value 8.0
end

Factory.define :negative_effort_value, :class => Effort do |e|
  e.deliverable_id 8
  e.user_id 2
  e.value -1.0
end

