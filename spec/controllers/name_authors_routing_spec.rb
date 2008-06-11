require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameAuthorsController do
  describe "route generation" do

    it "should map { :controller => 'name_authors', :action => 'index' } to /name_authors" do
      route_for(:controller => "name_authors", :action => "index").should == "/name_authors"
    end
  
    it "should map { :controller => 'name_authors', :action => 'new' } to /name_authors/new" do
      route_for(:controller => "name_authors", :action => "new").should == "/name_authors/new"
    end
  
    it "should map { :controller => 'name_authors', :action => 'show', :id => 1 } to /name_authors/1" do
      route_for(:controller => "name_authors", :action => "show", :id => 1).should == "/name_authors/1"
    end
  
    it "should map { :controller => 'name_authors', :action => 'edit', :id => 1 } to /name_authors/1/edit" do
      route_for(:controller => "name_authors", :action => "edit", :id => 1).should == "/name_authors/1/edit"
    end
  
    it "should map { :controller => 'name_authors', :action => 'update', :id => 1} to /name_authors/1" do
      route_for(:controller => "name_authors", :action => "update", :id => 1).should == "/name_authors/1"
    end
  
    it "should map { :controller => 'name_authors', :action => 'destroy', :id => 1} to /name_authors/1" do
      route_for(:controller => "name_authors", :action => "destroy", :id => 1).should == "/name_authors/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'name_authors', action => 'index' } from GET /name_authors" do
      params_from(:get, "/name_authors").should == {:controller => "name_authors", :action => "index"}
    end
  
    it "should generate params { :controller => 'name_authors', action => 'new' } from GET /name_authors/new" do
      params_from(:get, "/name_authors/new").should == {:controller => "name_authors", :action => "new"}
    end
  
    it "should generate params { :controller => 'name_authors', action => 'create' } from POST /name_authors" do
      params_from(:post, "/name_authors").should == {:controller => "name_authors", :action => "create"}
    end
  
    it "should generate params { :controller => 'name_authors', action => 'show', id => '1' } from GET /name_authors/1" do
      params_from(:get, "/name_authors/1").should == {:controller => "name_authors", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_authors', action => 'edit', id => '1' } from GET /name_authors/1;edit" do
      params_from(:get, "/name_authors/1/edit").should == {:controller => "name_authors", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_authors', action => 'update', id => '1' } from PUT /name_authors/1" do
      params_from(:put, "/name_authors/1").should == {:controller => "name_authors", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'name_authors', action => 'destroy', id => '1' } from DELETE /name_authors/1" do
      params_from(:delete, "/name_authors/1").should == {:controller => "name_authors", :action => "destroy", :id => "1"}
    end
  end
end
