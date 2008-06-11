require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameString do
  before(:each) do
    @name_string = NameString.new
  end

  it "should be valid" do
    @name_string.should be_valid
  end
end
