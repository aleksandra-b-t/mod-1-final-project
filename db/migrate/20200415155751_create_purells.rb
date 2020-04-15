class CreatePurells < ActiveRecord::Migration[6.0]
  def change
    create_table :purells do |t|
      t.string :name, default: "PURELL"
      t.integer :usage, default: 4
      t.integer :hp, default: 2
      t.integer :user_id 
    end
  end
end
