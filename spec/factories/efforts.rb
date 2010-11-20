
Factory.define :valid_effort , :class => Effort do |e|
  e.sequence(:user_id) {|n| n}
  e.value 5.0
  e.deliverable {|l| l.association(:effort_deliverable) }
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



Factory.define :effort1, :class => Effort do |e|
  e.user_id 5
  e.value 10
  e.deliverable {|l| l.association(:effort_deliverable) }
end

Factory.define :effort2, :class => Effort do |e|
  e.user_id 47
  e.value 15
end


  


  

