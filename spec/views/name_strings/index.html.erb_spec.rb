require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_strings/index.html.erb" do
  include NameStringsHelper
  
  before(:each) do
    name_string_98 = mock_model(NameString)
    name_string_98.should_receive(:name).and_return("MyString")
    name_string_98.should_receive(:is_canonical).and_return(false)
    name_string_98.should_receive(:canonical_id).and_return("1")
    name_string_99 = mock_model(NameString)
    name_string_99.should_receive(:name).and_return("MyString")
    name_string_99.should_receive(:is_canonical).and_return(false)
    name_string_99.should_receive(:canonical_id).and_return("1")

    assigns[:name_strings] = [name_string_98, name_string_99]
  end

  it "should render list of name_strings" do
    render "/name_strings/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", false, 2)
  end
end

