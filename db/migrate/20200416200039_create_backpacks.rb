class CreateBackpacks < ActiveRecord::Migration[6.0]
  def change
    create_table :backpacks do |t|
      t.integer :user_id
      t.integer :item_id
    end
  end
end
