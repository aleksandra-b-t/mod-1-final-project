require_relative '../config/environment'
require 'pry'
Character.delete_all
ActiveRecord::Base.logger = nil

person = User.welcome
person.start_story 
person.item_problem 
person.age_prob 
person.item_problem_before_store
#binding.pry
# puts "HELLO WORLD"
