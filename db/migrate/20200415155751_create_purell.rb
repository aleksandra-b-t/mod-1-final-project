class CreatePurell < ActiveRecord::Migration[6.0]
  def change
    create_table :purell do |t|
      t.string :name, default: "PURELL"
      t.integer :usage, default: 4
      t.integer :hp, default: 2
    end
  end
end
