require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NameString do
  before(:each) do
    @name_string = nil
    @creating_name_string = lambda do
      @name_string = create_user
      violated "#{@name_string.errors.full_messages.to_sentence}" if @name_string.new_record?
    end
  end


protected
  def create_name_string(options = {})
    record = NameString.new({ :name => 'Plantago Major', :is_canonical => true, canonical_id => nil}.merge(options))
    record.save
    record
  end

end
