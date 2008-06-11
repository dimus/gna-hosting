require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameComposite do
  before(:each) do
    @name_composite = NameComposite.new
  end

  it "should be valid" do
    @name_composite.should be_valid
  end
end
