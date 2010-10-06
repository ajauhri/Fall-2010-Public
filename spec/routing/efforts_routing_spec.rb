require 'spec_helper'

describe EffortsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/efforts" }.should route_to(:controller => "efforts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/efforts/new" }.should route_to(:controller => "efforts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/efforts/1" }.should route_to(:controller => "efforts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/efforts/1/edit" }.should route_to(:controller => "efforts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/efforts" }.should route_to(:controller => "efforts", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/efforts/1" }.should route_to(:controller => "efforts", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/efforts/1" }.should route_to(:controller => "efforts", :action => "destroy", :id => "1") 
    end
  end
end
