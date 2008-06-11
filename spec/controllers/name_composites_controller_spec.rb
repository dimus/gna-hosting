require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameCompositesController do
  describe "handling GET /name_composites" do

    before(:each) do
      @name_composite = mock_model(NameComposite)
      NameComposite.stub!(:find).and_return([@name_composite])
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
  
    it "should find all name_composites" do
      NameComposite.should_receive(:find).with(:all).and_return([@name_composite])
      do_get
    end
  
    it "should assign the found name_composites for the view" do
      do_get
      assigns[:name_composites].should == [@name_composite]
    end
  end

  describe "handling GET /name_composites.xml" do

    before(:each) do
      @name_composites = mock("Array of NameComposites", :to_xml => "XML")
      NameComposite.stub!(:find).and_return(@name_composites)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all name_composites" do
      NameComposite.should_receive(:find).with(:all).and_return(@name_composites)
      do_get
    end
  
    it "should render the found name_composites as xml" do
      @name_composites.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /name_composites/1" do

    before(:each) do
      @name_composite = mock_model(NameComposite)
      NameComposite.stub!(:find).and_return(@name_composite)
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
  
    it "should find the name_composite requested" do
      NameComposite.should_receive(:find).with("1").and_return(@name_composite)
      do_get
    end
  
    it "should assign the found name_composite for the view" do
      do_get
      assigns[:name_composite].should equal(@name_composite)
    end
  end

  describe "handling GET /name_composites/1.xml" do

    before(:each) do
      @name_composite = mock_model(NameComposite, :to_xml => "XML")
      NameComposite.stub!(:find).and_return(@name_composite)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the name_composite requested" do
      NameComposite.should_receive(:find).with("1").and_return(@name_composite)
      do_get
    end
  
    it "should render the found name_composite as xml" do
      @name_composite.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /name_composites/new" do

    before(:each) do
      @name_composite = mock_model(NameComposite)
      NameComposite.stub!(:new).and_return(@name_composite)
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
  
    it "should create an new name_composite" do
      NameComposite.should_receive(:new).and_return(@name_composite)
      do_get
    end
  
    it "should not save the new name_composite" do
      @name_composite.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new name_composite for the view" do
      do_get
      assigns[:name_composite].should equal(@name_composite)
    end
  end

  describe "handling GET /name_composites/1/edit" do

    before(:each) do
      @name_composite = mock_model(NameComposite)
      NameComposite.stub!(:find).and_return(@name_composite)
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
  
    it "should find the name_composite requested" do
      NameComposite.should_receive(:find).and_return(@name_composite)
      do_get
    end
  
    it "should assign the found NameComposite for the view" do
      do_get
      assigns[:name_composite].should equal(@name_composite)
    end
  end

  describe "handling POST /name_composites" do

    before(:each) do
      @name_composite = mock_model(NameComposite, :to_param => "1")
      NameComposite.stub!(:new).and_return(@name_composite)
    end
    
    describe "with successful save" do
  
      def do_post
        @name_composite.should_receive(:save).and_return(true)
        post :create, :name_composite => {}
      end
  
      it "should create a new name_composite" do
        NameComposite.should_receive(:new).with({}).and_return(@name_composite)
        do_post
      end

      it "should redirect to the new name_composite" do
        do_post
        response.should redirect_to(name_composite_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @name_composite.should_receive(:save).and_return(false)
        post :create, :name_composite => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /name_composites/1" do

    before(:each) do
      @name_composite = mock_model(NameComposite, :to_param => "1")
      NameComposite.stub!(:find).and_return(@name_composite)
    end
    
    describe "with successful update" do

      def do_put
        @name_composite.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the name_composite requested" do
        NameComposite.should_receive(:find).with("1").and_return(@name_composite)
        do_put
      end

      it "should update the found name_composite" do
        do_put
        assigns(:name_composite).should equal(@name_composite)
      end

      it "should assign the found name_composite for the view" do
        do_put
        assigns(:name_composite).should equal(@name_composite)
      end

      it "should redirect to the name_composite" do
        do_put
        response.should redirect_to(name_composite_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @name_composite.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /name_composites/1" do

    before(:each) do
      @name_composite = mock_model(NameComposite, :destroy => true)
      NameComposite.stub!(:find).and_return(@name_composite)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the name_composite requested" do
      NameComposite.should_receive(:find).with("1").and_return(@name_composite)
      do_delete
    end
  
    it "should call destroy on the found name_composite" do
      @name_composite.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the name_composites list" do
      do_delete
      response.should redirect_to(name_composites_url)
    end
  end
end
