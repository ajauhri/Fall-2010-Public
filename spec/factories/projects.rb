Factory.define :project do |p|
  p.name "Project XWY"
  
  # This uses association and :lifecycle factory
  p.lifecycle_id {|l| l.association(:lifecycle) }
end