class ChangeItem1ToString < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :item_1_id
    add_column :characters, :item_1_id, :string 
  end
end
