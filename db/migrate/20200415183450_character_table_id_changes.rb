class CharacterTableIdChanges < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :rubber_gloves_id, :rubberglove_id
    rename_column :characters, :face_mask_id, :facemask_id
  end
end
