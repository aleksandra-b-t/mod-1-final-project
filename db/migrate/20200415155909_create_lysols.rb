class CreateLysols < ActiveRecord::Migration[6.0]
  def change
    create_table :lysols do |t|
      t.string :name, default: "LYSOL"
      # t.integer :usage, default: 2
      # t.integer :hp, default: 5
    end
  end
end
