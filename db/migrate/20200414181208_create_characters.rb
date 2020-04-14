class CreateCharacters < ActiveRecord::Migration[6.0]
  def change  
    create_table :characters do |t|
        t.integer :user_id
        t.string :name
        t.string :type
        t.integer :age
        t.integer :hp
        t.string :panic_cry
        t.integer :item_1_id
        # t.integer :item_2_id
        # t.integer :item_3_id
        t.string :endgame, default: "lose"
    end
  end
end
