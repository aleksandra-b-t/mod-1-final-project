require 'pry'
class User < ActiveRecord::Base
    has_many :characters
    has_many :items, through: :characters
    has_many :obstacles, through: :characters
    @@prompt = TTY::Prompt.new

    def self.welcome
        username = @@prompt.ask('ENTER YOUR PLAYER NAME:') 
        puts "WELCOME #{username}!"
        User.find_or_create_by(name: username)
    end


    def self.mode
        choices_1 = ["TEEN", "SENIOR"]
        type = @@prompt.multi_select("SELECT YOUR CHARACTER", choices_1, min: 1, max: 1)

        choices_2 = ["HELP!", "GET A JOB!", "(COUGH, COUGH)"]
        panicCry = @@prompt.multi_select("ENTER YOUR PANIC CRY:", choices_2, min: 1, max: 1)
        # case type
        # when "TEEN"
        #     Character.create(type: type,age: 15, hp: 10, panic_cry: panicCry)
        # when "SENIOR"
        #     Character.create(type: type,age: 60, hp: 5, panic_cry: panicCry)
        # end
        if type[0] == "TEEN"
            Character.create(
                age: 15, 
                hp: 10, 
                panic_cry: panicCry
                item_1_id: nil
                )
        elsif type[0] == "SENIOR"
            Character.create(
                age: 60, 
                hp: 5, 
                panic_cry: panicCry,
                item_1_id: nil
            )
        end
    end
end
