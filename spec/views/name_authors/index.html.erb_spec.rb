require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_authors/index.html.erb" do
  include NameAuthorsHelper
  
  before(:each) do
    name_author_98 = mock_model(NameAuthor)
    name_author_98.should_receive(:author_string).and_return("MyString")
    name_author_98.should_receive(:is_confirmed).and_return(false)
    name_author_99 = mock_model(NameAuthor)
    name_author_99.should_receive(:author_string).and_return("MyString")
    name_author_99.should_receive(:is_confirmed).and_return(false)

    assigns[:name_authors] = [name_author_98, name_author_99]
  end

  it "should render list of name_authors" do
    render "/name_authors/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "false", 2)
  end
end

