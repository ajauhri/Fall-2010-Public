require 'spec_helper'

describe LifecyclesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/lifecycles" }.should route_to(:controller => "lifecycles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/lifecycles/new" }.should route_to(:controller => "lifecycles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/lifecycles/1" }.should route_to(:controller => "lifecycles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/lifecycles/1/edit" }.should route_to(:controller => "lifecycles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/lifecycles" }.should route_to(:controller => "lifecycles", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/lifecycles/1" }.should route_to(:controller => "lifecycles", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/lifecycles/1" }.should route_to(:controller => "lifecycles", :action => "destroy", :id => "1") 
    end
  end
end
