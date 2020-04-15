require 'pry'
class User < ActiveRecord::Base
    has_many :characters
    has_many :items, through: :characters
    @@prompt = TTY::Prompt.new

    def self.welcome
        username = @@prompt.ask('ENTER YOUR PLAYER NAME:') 
        puts "WELCOME #{username.upcase}!"
        User.find_or_create_by(name: username)
    end


    def create_character
        choices_1 = ["TEEN", "SENIOR"]
        char = @@prompt.multi_select("SELECT YOUR CHARACTER", choices_1, min: 1, max: 1)

        choices_2 = ["HELP!", "GET A JOB!", "(COUGH, COUGH)"]
        panicCry = @@prompt.multi_select("SELECT YOUR PANIC CRY:", choices_2, min: 1, max: 1)
        # case type
        # when "TEEN"
        #     Character.create(type: type,age: 15, hp: 10, panic_cry: panicCry)
        # when "SENIOR"
        #     Character.create(type: type,age: 60, hp: 5, panic_cry: panicCry)
        # end
        if char[0] == "TEEN"
            Character.create(
                user_id: self.id,
                name: self.name,
                char_type: char[0],
                age: 15, 
                hp: 10, 
                panic_cry: panicCry,
                item_1_id: nil
                )
        elsif char[0] == "SENIOR"
            Character.create(
                user_id: self.id,
                name: self.name,
                char_type: char[0],
                age: 60, 
                hp: 5, 
                panic_cry: panicCry,
                item_1_id: nil
            )
        end
    end

    def start_story
        puts ":::888888888888888888888888888888888888***8888888888888888888888::::88"
        puts "::::8888888888888888888888P   ____.------.____   488888888888888:::888"
        puts "::::88888888888888888P __.--||    _._         ||--.__ 4888888888:::888"
        puts ":::::888888888888P _.-|        .-~ | ~-.             |-._ 488888:::888"
        puts ":::::888888888P _-|            |   |   |                 |-_ 488::8888"
        puts "::::::888888P ,'               |  _:_  |                    .-:~--.._8"
        puts "8:::::88888 ,'            .  .-|~~ | ~~|-.                .~  |      |"
        puts "88:::::88P /_.-~:.   .   :   |     |     |       .        |   |      |"
        puts "888::::8P /|    | `.o    !   |     |     |        :       |   |      |"
        puts " _..--~:-. |    |  |         |     |     |                |   |      |"
        puts " |      |  ~.   |  |         |  __.:.__  |                |   |      |"
        puts " |      |   |   |  |       .-|~~   |   ~~|-.              |   |      |"
        puts " |      |   |  _|.--~:-.   |       |       |         .:~-.|   |      |"
        puts " |      |   | |      |  ~. |       |   _.-:~--._   .' |   |   |      |"
        puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
        puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
        puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
        puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
        puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "                                                                      "
        puts "                                                                      "
        puts "THE YEAR... 2020. THE PLACE... NEW YORK CITY."
        puts "                                                                      "
        puts "IT'S DAY 187 SINCE THE COVID-19 PANDEMIC BEGAN."
        puts "                                                                      "
        puts "YOU WAKE UP IN YOUR BED TO THE SOUND OF A RINGING TELEPHONE."
        puts "                                                                      "
        puts "#{self.name.upcase}: HELLO?"
        puts "                                                                      "
        puts "#{self.name.upcase}!!! IT'S [insert person]. I RAN OUT OF TOILET PAPER!"
        puts "                                                                      "
        puts "PLEASE BE A KIND SOUL AND BRING ME SOME?"
        puts "                                                                      "
    end
end
