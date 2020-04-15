class CreateRubberGloves < ActiveRecord::Migration[6.0]
  def change
    create_table :rubber_gloves do |t|
      t.string :name, default: "RUBBER GLOVES"
      t.integer :usage, default: 1
      t.integer :hp, default: 10
      t.integer :user_id 
    end
  end
end
