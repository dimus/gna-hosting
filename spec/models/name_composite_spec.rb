require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameComposite do
  fixtures :name_composites, :name_strings, :name_authors, :name_years
  before(:each) do
    @name_composite = NameComposite.new
  end

  it "should be valid" do
    @name_composite.should be_valid
  end
end
