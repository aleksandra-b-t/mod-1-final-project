class ChangeColumnsCharacters2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :characters, :item_1_id, :purell
    add_column :characters, :purell_id, :integer
    rename_column :characters, :item_2_id, :rubber_gloves
    add_column :characters, :rubber_gloves_id, :integer
    rename_column :characters, :item_3_id, :face_mask
    add_column :characters, :face_mask_id, :integer
    add_column :characters, :lysol, :boolean
  end
end
