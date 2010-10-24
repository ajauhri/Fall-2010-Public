Factory.define :xp_iteration0, :class => ProjectPhase do |p|
  p.name "Iteration 0"

  # This uses association and :lifecycle factory
  p.project_id {|l| l.association(:project) }
end
