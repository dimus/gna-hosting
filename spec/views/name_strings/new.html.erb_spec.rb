require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_strings/new.html.erb" do
  include NameStringsHelper
  
  before(:each) do
    @name_string = mock_model(NameString)
    @name_string.stub!(:new_record?).and_return(true)
    @name_string.stub!(:name).and_return("MyString")
    @name_string.stub!(:is_canonical).and_return(false)
    @name_string.stub!(:canonical_id).and_return("1")
    assigns[:name_string] = @name_string
  end

  it "should render new form" do
    render "/name_strings/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", name_strings_path) do
      with_tag("input#name_string_name[name=?]", "name_string[name]")
      with_tag("input#name_string_is_canonical[name=?]", "name_string[is_canonical]")
    end
  end
end


