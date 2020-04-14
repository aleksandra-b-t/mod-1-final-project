class Obstacle < ActiveRecord::Base
    belongs_to :item
    belongs_to :character
    @@prompt = TTY::Prompt.new
end
