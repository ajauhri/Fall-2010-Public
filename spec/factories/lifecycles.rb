Factory.define :lifecycle do |l|
  l.name "XP Agile"
  l.description "Popular agile methodology"
end

Factory.define :lifecycle_XP_phase, :class => LifecyclePhase do |lxp|
  lxp.sequence(:name) {|n| "Iteration #{n}"}
  lxp.association :lifecycle, :factory => :lifecycle
end

Factory.define :lifecycle_waterfall_phase, :class => LifecyclePhase do |lwp|
  lwp.sequence(:name) {|n| "Phase #{n}"}
  lwp.association :lifecycle, :factory => :lifecycle_waterfall
end

#how to add inheritance using factories

Factory.define :lifecycle_waterfall, :parent => :lifecycle do |l|
  l.name "Waterfall"
end
