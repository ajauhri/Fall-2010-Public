require 'spec_helper'

describe LifecyclePhasesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/lifecycle_phases" }.should route_to(:controller => "lifecycle_phases", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/lifecycle_phases/new" }.should route_to(:controller => "lifecycle_phases", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/lifecycle_phases/1" }.should route_to(:controller => "lifecycle_phases", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/lifecycle_phases/1/edit" }.should route_to(:controller => "lifecycle_phases", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/lifecycle_phases" }.should route_to(:controller => "lifecycle_phases", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/lifecycle_phases/1" }.should route_to(:controller => "lifecycle_phases", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/lifecycle_phases/1" }.should route_to(:controller => "lifecycle_phases", :action => "destroy", :id => "1") 
    end
  end
end
