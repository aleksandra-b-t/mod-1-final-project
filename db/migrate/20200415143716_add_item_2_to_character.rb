class AddItem2ToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :item_2_id, :string 
    add_column :characters, :item_3_id, :string 
    add_column :characters, :turns, :integer  
  end
end
