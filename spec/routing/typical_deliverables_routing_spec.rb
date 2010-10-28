require 'spec_helper'

describe TypicalDeliverablesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/typical_deliverables" }.should route_to(:controller => "typical_deliverables", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/typical_deliverables/new" }.should route_to(:controller => "typical_deliverables", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/typical_deliverables/1" }.should route_to(:controller => "typical_deliverables", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/typical_deliverables/1/edit" }.should route_to(:controller => "typical_deliverables", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/typical_deliverables" }.should route_to(:controller => "typical_deliverables", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/typical_deliverables/1" }.should route_to(:controller => "typical_deliverables", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/typical_deliverables/1" }.should route_to(:controller => "typical_deliverables", :action => "destroy", :id => "1") 
    end
  end
end
