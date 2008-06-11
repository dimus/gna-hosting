require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_authors/edit.html.erb" do
  include NameAuthorsHelper
  
  before do
    @name_author = mock_model(NameAuthor)
    @name_author.stub!(:author_string).and_return("MyString")
    @name_author.stub!(:is_confirmed).and_return(false)
    assigns[:name_author] = @name_author
  end

  it "should render edit form" do
    render "/name_authors/edit.html.erb"
    
    response.should have_tag("form[action=#{name_author_path(@name_author)}][method=post]") do
      with_tag('input#name_author_author_string[name=?]', "name_author[author_string]")
      with_tag('input#name_author_is_confirmed[name=?]', "name_author[is_confirmed]")
    end
  end
end


