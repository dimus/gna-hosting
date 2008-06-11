require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameAuthorsController do
  describe "handling GET /name_authors" do

    before(:each) do
      @name_author = mock_model(NameAuthor)
      NameAuthor.stub!(:find).and_return([@name_author])
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
  
    it "should find all name_authors" do
      NameAuthor.should_receive(:find).with(:all).and_return([@name_author])
      do_get
    end
  
    it "should assign the found name_authors for the view" do
      do_get
      assigns[:name_authors].should == [@name_author]
    end
  end

  describe "handling GET /name_authors.xml" do

    before(:each) do
      @name_authors = mock("Array of NameAuthors", :to_xml => "XML")
      NameAuthor.stub!(:find).and_return(@name_authors)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all name_authors" do
      NameAuthor.should_receive(:find).with(:all).and_return(@name_authors)
      do_get
    end
  
    it "should render the found name_authors as xml" do
      @name_authors.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /name_authors/1" do

    before(:each) do
      @name_author = mock_model(NameAuthor)
      NameAuthor.stub!(:find).and_return(@name_author)
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
  
    it "should find the name_author requested" do
      NameAuthor.should_receive(:find).with("1").and_return(@name_author)
      do_get
    end
  
    it "should assign the found name_author for the view" do
      do_get
      assigns[:name_author].should equal(@name_author)
    end
  end

  describe "handling GET /name_authors/1.xml" do

    before(:each) do
      @name_author = mock_model(NameAuthor, :to_xml => "XML")
      NameAuthor.stub!(:find).and_return(@name_author)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the name_author requested" do
      NameAuthor.should_receive(:find).with("1").and_return(@name_author)
      do_get
    end
  
    it "should render the found name_author as xml" do
      @name_author.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /name_authors/new" do

    before(:each) do
      @name_author = mock_model(NameAuthor)
      NameAuthor.stub!(:new).and_return(@name_author)
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
  
    it "should create an new name_author" do
      NameAuthor.should_receive(:new).and_return(@name_author)
      do_get
    end
  
    it "should not save the new name_author" do
      @name_author.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new name_author for the view" do
      do_get
      assigns[:name_author].should equal(@name_author)
    end
  end

  describe "handling GET /name_authors/1/edit" do

    before(:each) do
      @name_author = mock_model(NameAuthor)
      NameAuthor.stub!(:find).and_return(@name_author)
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
  
    it "should find the name_author requested" do
      NameAuthor.should_receive(:find).and_return(@name_author)
      do_get
    end
  
    it "should assign the found NameAuthor for the view" do
      do_get
      assigns[:name_author].should equal(@name_author)
    end
  end

  describe "handling POST /name_authors" do

    before(:each) do
      @name_author = mock_model(NameAuthor, :to_param => "1")
      NameAuthor.stub!(:new).and_return(@name_author)
    end
    
    describe "with successful save" do
  
      def do_post
        @name_author.should_receive(:save).and_return(true)
        post :create, :name_author => {}
      end
  
      it "should create a new name_author" do
        NameAuthor.should_receive(:new).with({}).and_return(@name_author)
        do_post
      end

      it "should redirect to the new name_author" do
        do_post
        response.should redirect_to(name_author_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @name_author.should_receive(:save).and_return(false)
        post :create, :name_author => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /name_authors/1" do

    before(:each) do
      @name_author = mock_model(NameAuthor, :to_param => "1")
      NameAuthor.stub!(:find).and_return(@name_author)
    end
    
    describe "with successful update" do

      def do_put
        @name_author.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the name_author requested" do
        NameAuthor.should_receive(:find).with("1").and_return(@name_author)
        do_put
      end

      it "should update the found name_author" do
        do_put
        assigns(:name_author).should equal(@name_author)
      end

      it "should assign the found name_author for the view" do
        do_put
        assigns(:name_author).should equal(@name_author)
      end

      it "should redirect to the name_author" do
        do_put
        response.should redirect_to(name_author_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @name_author.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /name_authors/1" do

    before(:each) do
      @name_author = mock_model(NameAuthor, :destroy => true)
      NameAuthor.stub!(:find).and_return(@name_author)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the name_author requested" do
      NameAuthor.should_receive(:find).with("1").and_return(@name_author)
      do_delete
    end
  
    it "should call destroy on the found name_author" do
      @name_author.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the name_authors list" do
      do_delete
      response.should redirect_to(name_authors_url)
    end
  end
end
