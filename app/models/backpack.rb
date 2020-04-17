require 'pry'
class Backpack < ActiveRecord::Base
    belongs_to :user
    belongs_to :item
    @@prompt = TTY::Prompt.new



end
