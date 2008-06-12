class NameString < ActiveRecord::Base
  has_many :name_composites
  has_many :name_strings, :foreign_key => "canonical_id"
  belongs_to :name_string, :foreign_key => "canonical_id"
end
