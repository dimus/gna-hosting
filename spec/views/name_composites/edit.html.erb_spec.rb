require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_composites/edit.html.erb" do
  include NameCompositesHelper
  
  before do
    @name_composite = mock_model(NameComposite)
    @name_composite.stub!(:name_string).and_return()
    @name_composite.stub!(:name_author).and_return()
    @name_composite.stub!(:name_year).and_return()
    @name_composite.stub!(:is_confirmed).and_return(false)
    assigns[:name_composite] = @name_composite
  end

  it "should render edit form" do
    render "/name_composites/edit.html.erb"
    
    response.should have_tag("form[action=#{name_composite_path(@name_composite)}][method=post]") do
      with_tag('input#name_composite_name_string[name=?]', "name_composite[name_string]")
      with_tag('input#name_composite_name_author[name=?]', "name_composite[name_author]")
      with_tag('input#name_composite_name_year[name=?]', "name_composite[name_year]")
      with_tag('input#name_composite_is_confirmed[name=?]', "name_composite[is_confirmed]")
    end
  end
end


