require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameStringsController do
  describe "handling GET /name_strings" do

    before(:each) do
      @name_string = mock_model(NameString)
      NameString.stub!(:find).and_return([@name_string])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all name_strings" do
      NameString.should_receive(:find).with(:all).and_return([@name_string])
      do_get
    end
  
    it "should assign the found name_strings for the view" do
      do_get
      assigns[:name_strings].should == [@name_string]
    end
  end

  describe "handling GET /name_strings.xml" do

    before(:each) do
      @name_strings = mock("Array of NameStrings", :to_xml => "XML")
      NameString.stub!(:find).and_return(@name_strings)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all name_strings" do
      NameString.should_receive(:find).with(:all).and_return(@name_strings)
      do_get
    end
  
    it "should render the found name_strings as xml" do
      @name_strings.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /name_strings/1" do

    before(:each) do
      @name_string = mock_model(NameString)
      NameString.stub!(:find).and_return(@name_string)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the name_string requested" do
      NameString.should_receive(:find).with("1").and_return(@name_string)
      do_get
    end
  
    it "should assign the found name_string for the view" do
      do_get
      assigns[:name_string].should equal(@name_string)
    end
  end

  describe "handling GET /name_strings/1.xml" do

    before(:each) do
      @name_string = mock_model(NameString, :to_xml => "XML")
      NameString.stub!(:find).and_return(@name_string)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the name_string requested" do
      NameString.should_receive(:find).with("1").and_return(@name_string)
      do_get
    end
  
    it "should render the found name_string as xml" do
      @name_string.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /name_strings/new" do

    before(:each) do
      @name_string = mock_model(NameString)
      NameString.stub!(:new).and_return(@name_string)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new name_string" do
      NameString.should_receive(:new).and_return(@name_string)
      do_get
    end
  
    it "should not save the new name_string" do
      @name_string.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new name_string for the view" do
      do_get
      assigns[:name_string].should equal(@name_string)
    end
  end

  describe "handling GET /name_strings/1/edit" do

    before(:each) do
      @name_string = mock_model(NameString)
      NameString.stub!(:find).and_return(@name_string)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the name_string requested" do
      NameString.should_receive(:find).and_return(@name_string)
      do_get
    end
  
    it "should assign the found NameString for the view" do
      do_get
      assigns[:name_string].should equal(@name_string)
    end
  end

  describe "handling POST /name_strings" do

    before(:each) do
      @name_string = mock_model(NameString, :to_param => "1")
      NameString.stub!(:new).and_return(@name_string)
    end
    
    describe "with successful save" do
  
      def do_post
        @name_string.should_receive(:save).and_return(true)
        post :create, :name_string => {}
      end
  
      it "should create a new name_string" do
        NameString.should_receive(:new).with({}).and_return(@name_string)
        do_post
      end

      it "should redirect to the new name_string" do
        do_post
        response.should redirect_to(name_string_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @name_string.should_receive(:save).and_return(false)
        post :create, :name_string => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /name_strings/1" do

    before(:each) do
      @name_string = mock_model(NameString, :to_param => "1")
      NameString.stub!(:find).and_return(@name_string)
    end
    
    describe "with successful update" do

      def do_put
        @name_string.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the name_string requested" do
        NameString.should_receive(:find).with("1").and_return(@name_string)
        do_put
      end

      it "should update the found name_string" do
        do_put
        assigns(:name_string).should equal(@name_string)
      end

      it "should assign the found name_string for the view" do
        do_put
        assigns(:name_string).should equal(@name_string)
      end

      it "should redirect to the name_string" do
        do_put
        response.should redirect_to(name_string_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @name_string.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /name_strings/1" do

    before(:each) do
      @name_string = mock_model(NameString, :destroy => true)
      NameString.stub!(:find).and_return(@name_string)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the name_string requested" do
      NameString.should_receive(:find).with("1").and_return(@name_string)
      do_delete
    end
  
    it "should call destroy on the found name_string" do
      @name_string.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the name_strings list" do
      do_delete
      response.should redirect_to(name_strings_url)
    end
  end
end
