require_relative '../config/environment'
require 'pry'
Character.delete_all
ActiveRecord::Base.logger = nil

person = User.welcome
person.start_story 
person.see_a_friend 
person.see_a_cute_dog
person.encounter_hobo
person.buying_toilet_paper 
#binding.pry
# puts "HELLO WORLD"
