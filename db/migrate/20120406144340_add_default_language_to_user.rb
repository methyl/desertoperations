class AddDefaultLanguageToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_language_id, :string, :default => "uk"

  end
end
