require_relative '../config/environment'
require 'pry'
Character.delete_all


person = User.welcome
character = person.create_character
character.start_story
character.pick_item 
character.see_a_friend 
character.see_a_cute_dog
character.encounter_hobo
#binding.pry
# puts "HELLO WORLD"
