require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_authors/show.html.erb" do
  include NameAuthorsHelper
  
  before(:each) do
    @name_author = mock_model(NameAuthor)
    @name_author.stub!(:author_string).and_return("MyString")
    @name_author.stub!(:is_confirmed).and_return(false)

    assigns[:name_author] = @name_author
  end

  it "should render attributes in <p>" do
    render "/name_authors/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/als/)
  end
end

