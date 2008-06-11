class CreateNameComposites < ActiveRecord::Migration
  def self.up
    create_table :name_composites do |t|
      t.references :name_string
      t.references :name_author
      t.references :name_year
      t.boolean :is_confirmed

      t.timestamps
    end
  end

  def self.down
    drop_table :name_composites
  end
end
