class AddingImportantPersonToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :important_person, :string 
  end
end
