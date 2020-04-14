class Character < ActiveRecord::Base
    has_many :obstacles
    belongs_to :user
    belongs_to :item
    @@prompt = TTY::Prompt.new
end
