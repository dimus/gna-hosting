class NameComposite < ActiveRecord::Base
  belongs_to :name_string
  belongs_to :name_author
  belongs_to :name_year
end
