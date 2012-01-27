class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.string :lang
      t.integer :front

      t.timestamps
    end
  end
end
