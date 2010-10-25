require 'spec_helper'

describe DeliverableTypesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/deliverable_types" }.should route_to(:controller => "deliverable_types", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/deliverable_types/new" }.should route_to(:controller => "deliverable_types", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/deliverable_types/1" }.should route_to(:controller => "deliverable_types", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/deliverable_types/1/edit" }.should route_to(:controller => "deliverable_types", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/deliverable_types" }.should route_to(:controller => "deliverable_types", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/deliverable_types/1" }.should route_to(:controller => "deliverable_types", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/deliverable_types/1" }.should route_to(:controller => "deliverable_types", :action => "destroy", :id => "1") 
    end
  end
end
