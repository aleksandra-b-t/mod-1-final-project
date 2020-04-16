class AddingCharToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :character_type, :string 
  end
end
