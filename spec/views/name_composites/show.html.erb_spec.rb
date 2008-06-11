require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_composites/show.html.erb" do
  include NameCompositesHelper
  
  before(:each) do
    @name_composite = mock_model(NameComposite)
    @name_composite.stub!(:name_string).and_return()
    @name_composite.stub!(:name_author).and_return()
    @name_composite.stub!(:name_year).and_return()
    @name_composite.stub!(:is_confirmed).and_return(false)

    assigns[:name_composite] = @name_composite
  end

  it "should render attributes in <p>" do
    render "/name_composites/show.html.erb"
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(//)
    response.should have_text(/als/)
  end
end

