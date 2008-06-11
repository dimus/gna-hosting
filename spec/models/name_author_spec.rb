require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameAuthor do
  before(:each) do
    @name_author = NameAuthor.new
  end

  it "should be valid" do
    @name_author.should be_valid
  end
end
