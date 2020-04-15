class CreateCharacters < ActiveRecord::Migration[6.0]
  def change  
    create_table :characters do |t|
        t.integer :user_id
        t.string :char_type
        t.integer :starting_hp
    end
  end
end
