class CreateNameYears < ActiveRecord::Migration
  def self.up
    create_table :name_years do |t|
      t.integer :name_year

      t.timestamps
    end

    add_index(:name_years, :name_year, :unique => true, :name => 'idx_name_years1')
  end

  def self.down
    drop_table :name_years
  end
end
