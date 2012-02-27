class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages, :id => false do |t|
      t.string :name

      t.timestamps
    end
    
    execute "ALTER TABLE languages ADD PRIMARY KEY (name);"
  end
end
