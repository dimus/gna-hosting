class CreateNameAuthors < ActiveRecord::Migration
  def self.up
    create_table :name_authors do |t|
      t.string :author_string

      t.timestamps
    end

    add_index(:name_authors, :author_string, :unique => true, :name => 'idx_name_authors1')
  end

  def self.down
    drop_table :name_authors
  end
end
