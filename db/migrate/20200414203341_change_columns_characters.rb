class ChangeColumnsCharacters < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :type, :char_type
  end
end
