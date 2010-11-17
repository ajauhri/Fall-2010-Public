Factory.define :project do |p|
  p.name "Project XWY"
  
  # This uses association and :lifecycle factory
  p.lifecycle_id {|l| l.association(:lifecycle) }
end


Factory.define :archived_project, :class => Project do |p|
  p.name "Archived"
  p.status "Archived"
  # This uses association and :lifecycle factory
  p.lifecycle_id {|l| l.association(:lifecycle) }
end



Factory.define :inti_project, :class => Project do |p|
  p.name "Project XWY"
  
  # This uses association and :lifecycle factory
  p.lifecycle_id {|l| l.association(:lifecycle) }
end


Factory.define :project_phase_test, :class => Project do |p|
  p.name "New Project"
end


Factory.define :lifecycle_for_project, :class => Lifecycle do |l|
  l.name "Lifecycle for project"
end
