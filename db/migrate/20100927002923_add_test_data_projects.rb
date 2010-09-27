class AddTestDataProjects < ActiveRecord::Migration
  def self.up
    Project.delete_all

    Project.create(
      :name => "Project XYZ",
      :description => "At school, educational institute and university, a
    project is a research assignment given to a student which generally
    requires a larger amount of effort and more independent work than is
    involved in a normal essay assignment. It requires students to undertake
    their own fact-finding and analysis, either from library/internet research
    or from gathering data empirically. The written report that comes from the
    project is usually in the form of a dissertation, which will contain sections
    on the project's inception, methods of inquiry, analysis, findings and conclusions.",
      :lifecycle_id => Lifecycle.first.id
    )

    Project.create(
      :name => "Project Rails",
      :description => "Unlike some other uses of iron and steel, railway rails
     are subject to very high stresses and have to be made of very high quality
     steel. It took many decades to improve the quality of the materials,
     including the change from iron to steel.",
      :lifecycle_id => Lifecycle.first.id
    )
  end

  def self.down

  end
end
