class Item < ActiveRecord::Base
    has_many :characters
    has_many :obstacles
    has_many :users, through: :characters
end