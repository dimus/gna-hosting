require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_composites/index.html.erb" do
  include NameCompositesHelper
  
  before(:each) do
    name_composite_98 = mock_model(NameComposite)
    name_composite_98.should_receive(:name_string).and_return(NameString.new(:name => "Plantago Major"))
    name_composite_98.should_receive(:name_author).and_return(NameAuthor.new(:author_string => "L."))
    name_composite_98.should_receive(:name_year).and_return(NameYear.new(:name_year => nil))
    name_composite_98.should_receive(:is_confirmed).and_return(true)
    name_composite_99 = mock_model(NameComposite)
    name_composite_99.should_receive(:name_string).and_return(NameString.new(:name => "Puma concolor"))
    name_composite_99.should_receive(:name_author).and_return(NameAuthor.new(:author_string => "L."))
    name_composite_99.should_receive(:name_year).and_return(NameYear.new(:name_year => 1771))
    name_composite_99.should_receive(:is_confirmed).and_return(true)

    assigns[:name_composites] = [name_composite_98, name_composite_99]
  end

   it "should render list of name_composites" do
     render "/name_composites/index.html.erb"
     response.should have_tag("tr>td", "Plantago Major", 1)
     response.should have_tag("tr>td", "L.", 2)
     response.should have_tag("tr>td", "1771", 2)
   end
end

