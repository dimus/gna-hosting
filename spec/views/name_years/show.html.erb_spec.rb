require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/name_years/show.html.erb" do
  include NameYearsHelper
  
  before(:each) do
    @name_year = mock_model(NameYear)
    @name_year.stub!(:name_year).and_return("1")
    @name_year.stub!(:is_confirmed).and_return(false)

    assigns[:name_year] = @name_year
  end

  it "should render attributes in <p>" do
    render "/name_years/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/als/)
  end
end

