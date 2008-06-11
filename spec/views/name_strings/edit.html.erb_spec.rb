require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_strings/edit.html.erb" do
  include NameStringsHelper
  
  before do
    @name_string = mock_model(NameString)
    @name_string.stub!(:name).and_return("MyString")
    @name_string.stub!(:is_canonical).and_return(false)
    @name_string.stub!(:canonical_id).and_return("1")
    assigns[:name_string] = @name_string
  end

  it "should render edit form" do
    render "/name_strings/edit.html.erb"
    
    response.should have_tag("form[action=#{name_string_path(@name_string)}][method=post]") do
      with_tag('input#name_string_name[name=?]', "name_string[name]")
      with_tag('input#name_string_is_canonical[name=?]', "name_string[is_canonical]")
    end
  end
end


