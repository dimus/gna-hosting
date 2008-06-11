require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_strings/show.html.erb" do
  include NameStringsHelper
  
  before(:each) do
    @name_string = mock_model(NameString)
    @name_string.stub!(:name).and_return("MyString")
    @name_string.stub!(:is_canonical).and_return(false)
    @name_string.stub!(:canonical_id).and_return("1")

    assigns[:name_string] = @name_string
  end

  it "should render attributes in <p>" do
    render "/name_strings/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/als/)
  end
end

