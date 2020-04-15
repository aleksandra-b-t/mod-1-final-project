require 'pry'
class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :lysol
    belongs_to :purell 
    belongs_to :rubber_glove
    belongs_to :face_mask
    @@prompt = TTY::Prompt.new


    def apply_purell
        system("clear")
        sleep(2)
        if self.purell 
            puts "YOU USED YOUR PURELL. ADD 2 HEALTH POINTS"
            self.hp += 2
        end 
        sleep(2)
        puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
    end 


    def pick_item 
        system("clear")
        sleep(2)
        puts "THERE ARE THREE ITEMS ON YOUR KITCHEN TABLE."
        choices = ["PURELL", "RUBBER GLOVES", "FACE MASK", "LYSOL"]
        response = @@prompt.multi_select('WHAT DO YOU GRAB BEFORE LEAVING THE HOUSE?', choices, min: 2, max: 2)
       
       # binding.pry 
        case response[0]
        
        when "PURELL" 
            item = Purell.create 
            self.purell = item
        when "RUBBER GLOVES"
            item = RubberGlove.create
            self.rubber_glove = item
        when "FACE MASK"
            item = FaceMask.create
            self.face_mask = item
        when "LYSOL"
            Lysol.create 
            self.lysol = true 
        end 
       
        case response[1]
        
        when "PURELL" 
            item = Purell.create 
            self.purell = item
        when "RUBBER GLOVES"
            item = RubberGlove.create
            self.rubber_glove = item
        when "FACE MASK"
            item = FaceMask.create
            self.face_mask = item
        when "LYSOL"
            Lysol.create 
            self.lysol = true 
        end 
        sleep(2)
      puts "#{self.name} GRABS THE ITEMS AND GETS READY TO GO!" 
    end 

    def start_story

        if self.char_type == "TEEN"
            importantperson = "YOUR GRANDMOTHER"
        elsif self.char_type == "ADULT"
            importantperson = "YOUR ELDERLY MOTHER"
        elsif self.char_type == "SENIOR"
            importantperson = "YOUR DISABLED ADULT CHILD"
        end 

        system("clear")
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
        sleep(2)
        puts "IT'S DAY 187 SINCE THE COVID-19 PANDEMIC BEGAN."
        puts "                                                                      "
        sleep(2)
        puts "YOU WAKE UP IN YOUR BED TO THE SOUND OF A RINGING TELEPHONE."
        puts "                                                                      "
        sleep(2)
        puts "#{self.name.upcase}: HELLO?"
        puts "                                                                      "
        sleep(2)
        puts "#{self.name.upcase}!!! IT'S #{importantperson}. I RAN OUT OF TOILET PAPER!"
        puts "PLEASE BE A KIND SOUL AND BRING ME SOME?"
        puts "                                                                      "
        sleep(5)

end

def see_a_friend 
    system("clear")
    puts "NAVIGATING YOUR WAY THROUGH THE EMPTY STREETS YOU SEE A FAMILIAR FACE"
    sleep(2)
    puts "IT'S YOUR FRIEND GREG WAVING AT YOU FROM ACCROSS THE STREET"
    sleep(2)
    choices = ["SPRAY LYSOL IN HIS DIRECTION AND RUN AWAY", "SMILE AND WAVE FROM A FAR", "HE LOOKS HEALTHY! CROSS THE STREET AND SAY HELLO."]
    response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
    sleep(2)
    case response[0]
    when "SPRAY LYSOL IN HIS DIRECTION AND RUN AWAY" || "SMILE AND WAVE FROM A FAR"
        puts "GOOD WORK! NO HEALTH POINTS DEDUCTED"
    when "HE LOOKS HEALTHY! CROSS THE STREET AND SAY HELLO."
        puts "HE IS HAPPY TO SEE YOU AN OFFERS YOU A CIGARETTE"

        choices = ["GREAT! THIS TRIP HAS BEEN STRESSFUL I COULD REALLY USE ONE.", "NO THANK YOU, GREG!"]
        response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)

        if response[0] == "GREAT! THIS TRIP HAS BEEN STRESSFUL I COULD REALLY USE ONE."
            puts "YOU HAVE COME IN CONTACT WITH THE VIRUS. LOSE 5 HEALTH POINTS."
            self.hp -= 5
        else 
            puts "YOU HAVE AVOIDED DIRECT INFECTION BUT MAY STILL BE CARRYING THE VIRUS. LOSE 3 HEALTH POINTS."
            self.hp -= 3
        end 

    end 
    puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
    self.death_status
end 

def see_a_cute_dog 
    system("clear")
    sleep(2)
    @@prompt.warn ("You see a cute dog on the street wagging her tail")
    sleep(2)
    @@prompt.warn ("She is on a leash at least six feet from her owner")
    sleep(2)
    @@prompt.warn ("|\_/|")                  
    @@prompt.warn ("| @ @   Woof!")
    @@prompt.warn ("|   <>              _")
    @@prompt.warn ("|  _/\------____ ((| |))")
    @@prompt.warn ("|               `--' |")  
    @@prompt.warn ("____|_       ___|   |___.'")
    @@prompt.warn  ("/_/_____/____/_______|")  

    sleep(2)
  
  choices = ["GO OVER AND PET HER!", "BEND DOWN AND LET HER LICK YOUR FACE", "CROSS THE STREET."]
  response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
   sleep(2)
  case response[0]
  when "GO OVER AND PET HER!"
    puts "YOU GOT TO PET A DOG BUT UNFORNATELY SHE WAS CARRYING THE VIRUS. LOSE 4 HEALTH POINTS."
    self.hp -= 4
  when "BEND DOWN AND LET HER LICK YOUR FACE"
    puts "YOU HAVE BEEN DIRECTLY INFECTED WITH THE VIRUS. LOSE 10 HEATLTH POINTS."
    self.hp -= 10 
  when "CROSS THE STREET."
    puts "GOOD WORK! HER OWNER IS INFECTED WITH THE VIRUS. NO HEALTH POINTS DEDUCTED"
  end 
  puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
  self.death_status
end 




def encounter_hobo
    system("clear")
    puts "AS YOU CONTINUE DOWN THE BLOCK, YOU SEE A HOMELESS MAN COMING YOUR WAY."
    puts "                                                "
    choices = ["USE PANIC CRY!", "SPRAY HIM WITH LYSOL AND RUN!"]
    response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
    puts "                                                "
    sleep(1)
    if response[0] == "USE PANIC CRY!"
        if self.panic_cry == "[\"HELP!\"]"
            self.hp -= 2
            puts "THE HOBO TRIES TO COVER YOUR MOUTH BUT YOU MANAGE TO ESCAPE AND RUN AWAY. (LOSE 2 HEALTH POINTS)"
        elsif self.panic_cry == "[\"GET A JOB!\"]"
            self.hp -= 5
            puts "THE HOBO GETS ANGRY AND SPITS ON YOU. (LOSE 5 HEALTH POINTS)"
        elsif self.panic_cry == "[\"(COUGH, COUGH)\"]"
            self.hp -= 1
            puts "THE HOBO BECOMES AFRAID THAT YOU MIGHT HAVE COVID-19 AND WALKS PAST YOU. (LOSE 1 HEALTH POINT)"
        end
    else
        puts "THE HOBO GASPS AND YOU MAKE A CLEAN GETAWAY. (NO HEALTH POINTS DEDUCTED)"
    end
    puts "                                                "
    puts "CURRENT HEALTH: #{self.hp}" 
    puts "                                                "
    sleep(2)
    self.death_status
end    

def death_status
    if self.hp < 1
        system("clear")
        @@prompt.error("YOU'VE CONTRACTED THE VIRUS!")
        puts "                                                "
        puts "                                                "
        sleep(1)
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("▄██▀▀▀█▄┼▄██▀▀▀██▄┼███▀█▄█▀███┼██▀▀▀")
        @@prompt.error("██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼█┼┼┼██┼██┼┼┼")
        @@prompt.error("██┼┼┼▄▄▄┼██▄▄▄▄▄██┼██┼┼┼▀┼┼┼██┼██▀▀▀")
        @@prompt.error("██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██┼┼┼")
        @@prompt.error("▀██▄▄▄██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██▄▄▄")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("▄██▀▀▀██▄┼▀███┼┼██▀┼██▀▀▀┼██▀▀▀▀██▄┼")
        @@prompt.error("██┼┼┼┼┼██┼┼┼██┼┼██┼┼██┼┼┼┼██┼┼┼┼┼██┼")
        @@prompt.error("██┼┼┼┼┼██┼┼┼██┼┼██┼┼██▀▀▀┼██▄▄▄▄▄▀▀┼")
        @@prompt.error("██┼┼┼┼┼██┼┼┼██┼┼█▀┼┼██┼┼┼┼██┼┼┼┼██┼┼")
        @@prompt.error("▀██▄▄▄██▀┼┼┼─▀█▀┼┼─┼██▄▄▄┼██┼┼┼┼┼██▄")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼██┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼██┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼████▄┼┼┼▄▄▄▄▄▄▄┼┼┼▄████┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼▀▀█▄█████████▄█▀▀┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼█████████████┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼██▀▀▀███▀▀▀██┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼██┼┼┼███┼┼┼██┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼█████▀▄▀█████┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼┼███████████┼┼┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼▄▄▄██┼┼█▀█▀█┼┼██▄▄▄┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼▀▀██┼┼┼┼┼┼┼┼┼┼┼██▀▀┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼▀▀┼┼┼┼┼┼┼┼┼┼┼▀▀┼┼┼┼┼┼┼┼┼┼┼")
        @@prompt.error("┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼")    
    end
end

#METHOD

# def turn
#     num = rand(1..2)
#     if num == 1
#         safe
#     elsif num == 2
#         
# end

end
