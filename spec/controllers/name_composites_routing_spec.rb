require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameCompositesController do
  describe "route generation" do

    it "should map { :controller => 'name_composites', :action => 'index' } to /name_composites" do
      route_for(:controller => "name_composites", :action => "index").should == "/name_composites"
    end
  
    it "should map { :controller => 'name_composites', :action => 'new' } to /name_composites/new" do
      route_for(:controller => "name_composites", :action => "new").should == "/name_composites/new"
    end
  
    it "should map { :controller => 'name_composites', :action => 'show', :id => 1 } to /name_composites/1" do
      route_for(:controller => "name_composites", :action => "show", :id => 1).should == "/name_composites/1"
    end
  
    it "should map { :controller => 'name_composites', :action => 'edit', :id => 1 } to /name_composites/1/edit" do
      route_for(:controller => "name_composites", :action => "edit", :id => 1).should == "/name_composites/1/edit"
    end
  
    it "should map { :controller => 'name_composites', :action => 'update', :id => 1} to /name_composites/1" do
      route_for(:controller => "name_composites", :action => "update", :id => 1).should == "/name_composites/1"
    end
  
    it "should map { :controller => 'name_composites', :action => 'destroy', :id => 1} to /name_composites/1" do
      route_for(:controller => "name_composites", :action => "destroy", :id => 1).should == "/name_composites/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'name_composites', action => 'index' } from GET /name_composites" do
      params_from(:get, "/name_composites").should == {:controller => "name_composites", :action => "index"}
    end
  
    it "should generate params { :controller => 'name_composites', action => 'new' } from GET /name_composites/new" do
      params_from(:get, "/name_composites/new").should == {:controller => "name_composites", :action => "new"}
    end
  
    it "should generate params { :controller => 'name_composites', action => 'create' } from POST /name_composites" do
      params_from(:post, "/name_composites").should == {:controller => "name_composites", :action => "create"}
    end
  
    it "should generate params { :controller => 'name_composites', action => 'show', id => '1' } from GET /name_composites/1" do
      params_from(:get, "/name_composites/1").should == {:controller => "name_composites", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_composites', action => 'edit', id => '1' } from GET /name_composites/1;edit" do
      params_from(:get, "/name_composites/1/edit").should == {:controller => "name_composites", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_composites', action => 'update', id => '1' } from PUT /name_composites/1" do
      params_from(:put, "/name_composites/1").should == {:controller => "name_composites", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_composites', action => 'destroy', id => '1' } from DELETE /name_composites/1" do
      params_from(:delete, "/name_composites/1").should == {:controller => "name_composites", :action => "destroy", :id => "1"}
    end
  end
end
