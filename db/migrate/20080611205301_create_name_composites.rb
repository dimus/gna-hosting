class CreateNameComposites < ActiveRecord::Migration
  def self.up
    create_table :name_composites do |t|
      t.references :name_string
      t.references :name_author
      t.references :name_year
      t.boolean :is_confirmed #created from separate fields, not by parsing

      t.timestamps
    end

    add_index(:name_composites,  [:name_string_id, :name_author_id, :name_year_id], :unique => true, :name => 'idx_name_composites1')
  end

  def self.down
    drop_table :name_composites
  end
end
