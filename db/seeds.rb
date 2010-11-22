# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

lifecycles = Lifecycle.find(:all)
usr = User.find_last_by_username "admin"

22.times do
  project = Project.create!(:name => 'Project ' + Time.now.to_s,
    :lifecycle_id => lifecycles[rand(2)].id)

  desc = rand(6)
  
  if desc == 0
    project.name = "Ocean Express"
    project.description = "The Ocean Express Project will help satisfy the growing demand for natural gas in Florida, diversify the sources of supply to the state, and increase competitive alternatives to the existing pipeline infrastructure for the benefit of customers - all in an environmentally acceptable manner."
  elsif desc == 1
    project.name = "Nora"
    project.description = "The goal of the nora project is to produce software for discovering, visualizing, and exploring significant patterns across large collections of full-text humanities resources in existing digital libraries."
  elsif desc == 2
    project.name = "Taxonomy Micro Project"
    project.description = "The current project is designed to improve access to taxonomic records and microphotographs of freshwater zooplankton. The project integrates a large database and set of zooplankton samples with image capture and internet technologies, to provide easy access to images of cladoceran and copepod species common in the south-central United States."
  elsif desc == 3
    project.name  = "Starshine"
    project.description = "During the past six years, three small, optically reflective spherical STARSHINE student satellites have been designed by the U.S. Naval Research Laboratory and built by an informal, volunteer coalition of organizations and individuals in the USA and Canada. This coalition is called Project Starshine and is headquartered in Monument, Colorado. It receives no formal funding and operates by means of contributions of materials and labor from its member individuals and institutions. "
  elsif desc == 4
    project.name  = "K-2 Rock"
    project.description = "This past year the lessons designed for K-2, with revisions, were again taught in Rockridge/Lester Park School (ISD 709), twice a week for 20 minutes per lesson, this time by Joyce Duran. Students in higher grades who so opted were taught after school, once a week, for 40 minutes per lesson; third graders formed one group, and fourth and fifth graders, who had had no previous Spanish, formed another group."
  elsif desc == 5
    project.name = "DataTAG"
    project.description = "The DataTAG project will create a large-scale intercontinental Grid testbed that will focus upon advanced networking issues and interoperability between these intercontinental Grid domains, hence extending the capabilities of each and enhancing the worldwide programme of Grid development."
  end
  puts "Project (rndom) " + project.name
  
  phases = project.project_phases
  phases.each do |phase|
    deliverables = phase.deliverables
    deliverables.each do |del|
      if rand() > 0.5
        del.actual_size = del.estimated_size + rand(5)
      end
      complex  = rand(3)
      if complex == 0
        del.complexity = 'LOW'
      elsif complex == 1
        del.complexity = 'MEDIUM'
      else
        del.complexity = 'HIGH'
      end

      del.save!()

      Effort.create!(:effort_date => Date.today(),
        :value => (del.estimated_effort * (0.5 + rand())).round,
        :deliverable_id => del.id,
        :user_id => usr.id
      )
    end
  end
  project.status = 'Archived'
  project.save!
end

