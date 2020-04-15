class CreateFaceMasks < ActiveRecord::Migration[6.0]
  def change
    create_table :face_masks do |t|
      t.string :name, default: "FACE MASK"
      t.integer :usage, default: 1
      t.integer :hp, default: 6
      t.integer :user_id 
    end
  end
end
