class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :panic_cry
      t.integer :hp
      t.integer :turns 
      t.string :endgame, default: "lose"
      t.string :purell
      t.string :face_mask
      t.string :rubber_glove
      t.boolean :lysol 
    end
  end
end
