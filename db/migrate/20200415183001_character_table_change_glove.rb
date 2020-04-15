class CharacterTableChangeGlove < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :rubber_gloves, :rubber_glove 
  end
end
