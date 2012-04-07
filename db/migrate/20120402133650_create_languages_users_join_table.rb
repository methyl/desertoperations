class CreateLanguagesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :languages_users do |t|
      t.integer :language_id
      t.integer :user_id
    end
  end
end
