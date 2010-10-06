require 'spec_helper'

describe ProjectPhasesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/project_phases" }.should route_to(:controller => "project_phases", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/project_phases/new" }.should route_to(:controller => "project_phases", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/project_phases/1" }.should route_to(:controller => "project_phases", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/project_phases/1/edit" }.should route_to(:controller => "project_phases", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/project_phases" }.should route_to(:controller => "project_phases", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/project_phases/1" }.should route_to(:controller => "project_phases", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/project_phases/1" }.should route_to(:controller => "project_phases", :action => "destroy", :id => "1") 
    end
  end
end
