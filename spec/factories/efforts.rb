
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
