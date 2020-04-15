class CreateFaceMask < ActiveRecord::Migration[6.0]
  def change
    create_table :facemask do |t|
      t.string :name, default: "FACE MASK"
      t.integer :usage, default: 1
      t.integer :hp, default: 6
    end
  end
end
