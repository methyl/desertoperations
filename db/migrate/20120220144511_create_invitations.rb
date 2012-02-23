class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations, :id => false do |t|
      t.string :id
      t.boolean :trial, :default => false
      t.integer :user_id

      t.timestamps
    end

    execute "ALTER TABLE invitations ADD PRIMARY KEY (id);"
  end
end
