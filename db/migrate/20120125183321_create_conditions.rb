class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.integer :level
      t.integer :value

      t.timestamps
    end
  end
end
