require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_years/index.html.erb" do
  include NameYearsHelper
  
  before(:each) do
    name_year_98 = mock_model(NameYear)
    name_year_98.should_receive(:name_year).and_return("1")
    name_year_98.should_receive(:is_confirmed).and_return(false)
    name_year_99 = mock_model(NameYear)
    name_year_99.should_receive(:name_year).and_return("1")
    name_year_99.should_receive(:is_confirmed).and_return(false)

    assigns[:name_years] = [name_year_98, name_year_99]
  end

  it "should render list of name_years" do
    render "/name_years/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", false, 2)
  end
end

