class User < ActiveRecord::Base
    has_many :characters
    has_many :items, through: :characters
    has_many :obstacles, through: :characters
    @@prompt = TTY::Prompt.new
end
