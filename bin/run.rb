require_relative '../config/environment'
require 'pry'

person = User.welcome
character = person.create_character
person.start_story
character.encounter_hobo
#binding.pry
# puts "HELLO WORLD"
