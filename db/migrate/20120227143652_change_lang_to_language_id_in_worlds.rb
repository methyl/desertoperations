class ChangeLangToLanguageIdInWorlds < ActiveRecord::Migration
  def up
    rename_column :worlds, :lang, :language_id
  end

  def down
    rename_column :worlds, :language_id, :lang
  end
end
