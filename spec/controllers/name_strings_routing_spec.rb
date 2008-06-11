require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameStringsController do
  describe "route generation" do

    it "should map { :controller => 'name_strings', :action => 'index' } to /name_strings" do
      route_for(:controller => "name_strings", :action => "index").should == "/name_strings"
    end
  
    it "should map { :controller => 'name_strings', :action => 'new' } to /name_strings/new" do
      route_for(:controller => "name_strings", :action => "new").should == "/name_strings/new"
    end
  
    it "should map { :controller => 'name_strings', :action => 'show', :id => 1 } to /name_strings/1" do
      route_for(:controller => "name_strings", :action => "show", :id => 1).should == "/name_strings/1"
    end
  
    it "should map { :controller => 'name_strings', :action => 'edit', :id => 1 } to /name_strings/1/edit" do
      route_for(:controller => "name_strings", :action => "edit", :id => 1).should == "/name_strings/1/edit"
    end
  
    it "should map { :controller => 'name_strings', :action => 'update', :id => 1} to /name_strings/1" do
      route_for(:controller => "name_strings", :action => "update", :id => 1).should == "/name_strings/1"
    end
  
    it "should map { :controller => 'name_strings', :action => 'destroy', :id => 1} to /name_strings/1" do
      route_for(:controller => "name_strings", :action => "destroy", :id => 1).should == "/name_strings/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'name_strings', action => 'index' } from GET /name_strings" do
      params_from(:get, "/name_strings").should == {:controller => "name_strings", :action => "index"}
    end
  
    it "should generate params { :controller => 'name_strings', action => 'new' } from GET /name_strings/new" do
      params_from(:get, "/name_strings/new").should == {:controller => "name_strings", :action => "new"}
    end
  
    it "should generate params { :controller => 'name_strings', action => 'create' } from POST /name_strings" do
      params_from(:post, "/name_strings").should == {:controller => "name_strings", :action => "create"}
    end
  
    it "should generate params { :controller => 'name_strings', action => 'show', id => '1' } from GET /name_strings/1" do
      params_from(:get, "/name_strings/1").should == {:controller => "name_strings", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_strings', action => 'edit', id => '1' } from GET /name_strings/1;edit" do
      params_from(:get, "/name_strings/1/edit").should == {:controller => "name_strings", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_strings', action => 'update', id => '1' } from PUT /name_strings/1" do
      params_from(:put, "/name_strings/1").should == {:controller => "name_strings", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_strings', action => 'destroy', id => '1' } from DELETE /name_strings/1" do
      params_from(:delete, "/name_strings/1").should == {:controller => "name_strings", :action => "destroy", :id => "1"}
    end
  end
end
