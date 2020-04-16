require 'pry'
class User < ActiveRecord::Base
    has_many :characters
    has_many :purells
    has_many :face_masks
    has_many :rubber_gloves
    has_many :lysols 
    @@prompt = TTY::Prompt.new

    def item_problem_before_store 
        sleep(2)
        puts "#{self.name} APPROACHES THE STORE"
        puts "  "
        puts "THERE IS A LINE AND A MAN IN A HAZMAT SUIT LETTING PEOPLE IN ONE AT A TIME"
        puts "  "
        if self.purell != nil 
            sleep(2)
            puts "#{self.name} GETS IN LINE TRYING TO STAY 6 FEET AWAY FROM THE PERSON IN FRONT OF YOU"
            puts " "
            choices = ["APPLY MY PURELL!", "OFFER YOUR PURELL TO THE STRANGERS IN FRONT OF YOU"]
            response = @@prompt.multi_select('WHAT DO YOU DO?', choices, min: 1, max: 1)
            case response[0]
            when "APPLY MY PURELL!"
                apply_purell
            when "OFFER YOUR PURELL TO THE STRANGERS IN FRONT OF YOU"
                puts " "
                puts "A STRANGER THANKS YOU BY TOUCHING YOUR ARM AND GIVES YOU THE VIRUS"
                puts "  "
                puts "FIVE HEATLH POINTS DEDUCTED"
                self.hp -= 4 
            end 
        elsif self.rubber_glove != nil 
            sleep(2)
            puts "  "
            puts "THE PERSON IN FRONT OF YOU IS COUGHING"
            puts " "
            choices = ["RUN THE OTHER WAY", "TURN YOUR SCARF INTO A MASK"]
            response = @@prompt.multi_select('WHAT DO YOU DO?', choices, min: 1, max: 1)
            case response[0]
            when "RUN THE OTHER WAY"
                puts " "
                puts "GOOD THINKING! YOU HAVE AVOIDED THE VIRUS BUT FAILED TO BRING YOUR #{self.important_person} TOILET PAPER."
                sleep(2)
                self.hp -= 70 

            when "TURN YOUR SCARF INTO A MASK"
                puts " "
                puts "GREAT CHOICE! NO HEALTH POINTS DEDUCTED"
                sleep(2)
            end 

        elsif self.face_mask != nil
            sleep(2)
            puts "GOOD THING YOUR FACE IS PROTECHED"
            puts " "
            choices = ["POCKETS!!!", "WHO CARES? I HAVE A FACEMASK"]
            response = @@prompt.multi_select('WHAT DO YOU DO? WITH YOUR HANDS', choices, min: 1, max: 1)
            puts " "
            case response[0]
            when "POCKETS!!!"
                puts " "
                puts "GOOD THINKING. NO HEALTH POINTS DEDCUTED"
                puts " "
                sleep(2)
            when "WHO CARES? I HAVE A FACEMASK"
                puts " "
                puts "THE VIRUS GETS ON YOUR HANDS AND YOU SPREAD IT TO #{self.important_person}"
                puts "  "
                puts "LOSE 4 HEALTH POINTS "
                sleep(2)
                self.hp -= 4 
            end 
            
        end 
        self.buying_toilet_paper 
        death_status
    end 






    def item_problem 
        sleep(2)
        if self.purell != nil 
            puts "#{self.name.upcase} PUTS ON THIER SHOES AND WIPES DOWN THE DOOR HANDLE ON THEIR WAY OUT"
            puts " "
            choices = ["APPLY MY PURELL!", "NO NEED FOR PURELL, I JUST WIPED DOWN THE DOOR HANDLE"]
            response = @@prompt.multi_select('WHAT IS YOUR NEXT MOVE?', choices, min: 1, max: 1)
            case response[0]
            when "APPLY MY PURELL!"
                apply_purell
            when "NO NEED FOR PURELL, I JUST WIPED DOWN THE DOOR HANDLE"
                puts " "
                puts "YOURE CARING THE VIRUS AND WILL NOW INFECT 3 PEOPLE"
                puts "  "
                puts "FIVE HEATLH POINTS DEDUCTED"
                sleep(2)
                self.hp -= 4 
            end 
        elsif self.rubber_glove != nil 
            puts "  "
            puts "DONT FORGET TO TAKE OFF YOUR GLOVES BEFORE SEEING #{self.important_person}"
            puts " "
            puts "NO HEATLH POINTS DEDUCTED"
            sleep(2)

        elsif self.face_mask != nil
            puts "YOUR FACEMASK IS NOT COMFORTABLE"
            puts " "
            choices = ["NOTHING, IM NOT WEARING GLOVES", "ADJUST IT! IM GOING TO NEED TO WEAR THIS THE WHOLE TRIP!"]
            response = @@prompt.multi_select('WHAT DO YOU DO?', choices, min: 1, max: 1)
            puts " "
            case response[0]
            when "NOTHING, IM NOT WEARING GLOVES"
                puts " "
                puts "GOOD THINKING. NO HEALTH POINTS DEDCUTED"
                puts " "
                sleep(2)
            when "ADJUST IT! IM GOING TO NEED TO WEAR THIS THE WHOLE TRIP!"
                puts " "
                puts "IF THE VIRUS WAS ON YOUR HANDS YOUR FACEMASK HAS BEEN COMPRIMISED AND RENDERED USELESS"
                puts "  "
                puts "LOSE 4 HEALTH POINTS "
                sleep(2)
                self.hp -= 4 
            end 
            
        end 
        death_status
    end 

    def self.graveyard 
       person = self.all.last.name 
    puts "        _  /)"
    puts "        mo / )"
    puts "        |/)\)"
    puts "         /\_"
    puts "         \__|="
    puts "        (    )"
    puts "        __)(__"
    puts "  _____/      \\_____"
    puts " |  _     ___   _   ||"
    puts " | | \     |   | \  ||"
    puts " | |  |    |   |  | ||"
    puts " | |_/     |   |_/  ||"
    puts " | | \     |   |    ||"
    puts " | |  \    |   |    ||"
    puts " | |   \. _|_. | .  ||"
    puts " |                  ||"
    puts " |  #{person}  ||"
    puts " |                  ||"
puts "*       | *   **    * **   |**      **"
puts "\))ejm97/.,(//,,..,,\||(,,.,\\,.((//"  
    end 


    def buying_toilet_paper 
    system("clear")
    @@prompt.warn(".             .        .     .     |--|--|--|--|--|--|")
    @@prompt.warn(".                   _______|__|__|__|__|__|_ |  |===||")
    @@prompt.warn("__ *            .   )______________________________|-|")
    @@prompt.warn("__|  .      .   .  ))______________________________| |")
    @@prompt.warn("__|   )||      _|_|))       ooooooooooooooooooooo  |-|")
    @@prompt.warn("__|  |)|||__   ||||),-------8                   8 -| |")
    @@prompt.warn("__|._|)|||||.| |[=|),-------8  [ B O D E G A ]  8 -|-|")
    @@prompt.warn("__|[+|-|-|||||||[=|---------8                   8 -| |")
    @@prompt.warn("_-----.|)| )):|_[=||`-------8                   8 -|-|")
    @@prompt.warn(")|  )||))8) :  8_||`------  8ooooooooooooooooooo8 -| |")
    @@prompt.warn(")=| ))||) |  .  | |||_____________  ____  _________|-|")
    @@prompt.warn("==|))||  )   .   | ||_____________ |X|  | _________| |")
    @@prompt.warn("==| ||  )         | |_____________ |X| || _________| |")
    @@prompt.warn("==| |~ )     .     |")
    @@prompt.warn("==|)  )             |________________________________")
    puts " "
    puts " "
    puts "FINALLY #{self.name.upcase} YOU HAVE MADE IT TO THE DELI"
    puts " "
    sleep(2)
    puts "TO YOUR DISMAY THE STORE IS ALMOST OUT OF TOILET PAPER"
    puts " "
    sleep(2)
    toilet_choices
    end 

    def toilet_choices 
     choices = ["SINGLE PLY", "FANCY CHARMIN", "BODEGA BRAND RECYLEABLE"]
     paper = @@prompt.multi_select("WHICH DO YOU PICK:", choices, min: 1, max: 1)
    case paper[0]
    when "SINGLE PLY"
        puts " "
        puts "YOUR #{self.important_person} IS GOING TO LOVE IT!"
        puts " "
        sleep(2)
        puts "CONGRADUATIONS YOUR GOT YOUR TOILET PAPER AND WON THE GAME"
        #holding up toilet paper art?
    when "FANCY CHARMIN"
        puts " "
        puts "YOU PICK UP THE TOILET PAPER BUT THE BODEGA CAT HAS ALREADY GOTTEN TO IT"
        puts " "
        sleep(2)
        puts "YOU SNEEZE AND TOUCH YOUR FACE"
        puts " "
        sleep(2)
        puts "YOU HAVE BEEN INFECTED"
        self.hp -= 40
    when "BODEGA BRAND RECYLEABLE"
        puts " "
      puts "ODD CHOICE! CONGRADULATIONS YOU HAVE SUCCESSFUL GOTTEN #{self.important_person} THEIR TOILET PAPER AND WON THE GAME"
      #holding up toilet paper art?
     end 
     sleep(3)
    self.death_status
   end 

    def self.welcome
        system("clear")
        @@prompt.error("  /000000   /000000  /00    /00 /000000 /0000000         /000000  /00   /00 /00000000  /000000  /00000000")
        @@prompt.error(" /00__  00 /00__  00| 00   | 00|_  00_/| 00__  00       /00__  00| 00  | 00| 00_____/ /00__  00|__  00__/")
        @@prompt.error("| 00  |__/| 00  | 00| 00   | 00  | 00  | 00  | 00      | 00  | 00| 00  | 00| 00      | 00  |__/   | 00   ")
        puts " "
        @@prompt.error("| 00      | 00  | 00|  00 / 00/  | 00  | 00  | 00      | 00  | 00| 00  | 00| 00000   |  000000    | 00   ")
        puts " "
        @@prompt.error("| 00      | 00  | 00 |  00 00/   | 00  | 00  | 00      | 00  | 00| 00  | 00| 00__/    |____  00   | 00   ")
        puts " "
        @@prompt.error("| 00    00| 00  | 00  |  000/    | 00  | 00  | 00      | 00/00 00| 00  | 00| 00       /00  | 00   | 00   ")
        puts " "
        @@prompt.error("|  000000/|  000000/   |  0/    /000000| 0000000/      |  000000/|  000000/| 00000000|  000000/   | 00   ")
        puts " "
        @@prompt.error(" |______/  |______/     |_/    |______/|_______/        |____ 000 |______/ |________/ |______/    |__/   ")
        puts " "
        @@prompt.error("                                                            |__/                                         ")
        puts " "
        username = @@prompt.ask('ENTER YOUR PLAYER NAME:') 
        puts "WELCOME #{username.upcase}!"
        puts ' '
        choices_1 = ["TEEN", "ADULT","SENIOR"]
        char = @@prompt.multi_select("SELECT YOUR CHARACTER", choices_1, min: 1, max: 1)
        puts ' '
        choices_2 = ["HELP!", "GET A JOB!", "(COUGH, COUGH)"]
        panicCry = @@prompt.multi_select("SELECT YOUR PANIC CRY:", choices_2, min: 1, max: 1)
   
        if char[0] == "TEEN"
            person = User.create( name: username.upcase, hp: 10, panic_cry: panicCry[0])
            #person.start_story
            #person.see_a_friend
            #person.buying_toilet_paper


        elsif char[0] == "SENIOR"
            person = User.create( name: username.upcase, hp: 5, panic_cry: panicCry[0])
           # person.start_story
            #person.see_a_cute_dog
            #person.buying_toilet_paper
            

        elsif char[0] == "ADULT"
            person = User.create(name: username.upcase, hp: 7, panic_cry: panicCry[0])
           # person.start_story
            #person.encounter_hobo
            #person.buying_toilet_paper
            #the game seems short if we limit one encounter per character 

        end
    end


    def apply_purell
        sleep(2)
        if self.purell 
            puts "YOU USED YOUR PURELL. ADD 2 HEALTH POINTS"
            self.hp += 2
        end 
        sleep(2)
        puts "  "
        puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
    end 


    def pick_item 
        sleep(2)
        puts "YOU WANDER OUT OF BED AND PUT ON SOME SWEATPAINTS"
        puts " "
        puts "THERE ARE THREE ITEMS ON YOUR KITCHEN TABLE."
        choices = ["PURELL", "RUBBER GLOVES", "FACE MASK"]
        response = @@prompt.multi_select('WHAT DO YOU GRAB BEFORE LEAVING THE HOUSE?', choices, min: 1, max: 1)
       
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
        end 
       
        # case response[1]
        
        # when "PURELL" 
        #     item = Purell.create 
        #     self.purell = item
        # when "RUBBER GLOVES"
        #     item = RubberGlove.create
        #     self.rubber_glove = item
        # when "FACE MASK"
        #     item = FaceMask.create
        #     self.face_mask = item
        # end 
        sleep(2)
      puts " "
      puts "#{self.name} GRABS THE ITEMS LEAVES!"
      sleep(1)
    end 

    def start_story

        if self.hp == 10
            self.important_person = "YOUR GRANDMOTHER"
        elsif self.hp == 7
            self.important_person = "YOUR ELDERLY MOTHER"
        elsif self.hp == 5
            self.important_person = "YOUR DISABLED ADULT CHILD"
        end 

        system("clear")
        @@prompt.warn(":::888888888888888888888888888888888888***8888888888888888888888::::88")
        @@prompt.warn("::::8888888888888888888888P   ____.------.____   488888888888888:::888")
        @@prompt.warn("::::88888888888888888P __.--||    _._         ||--.__ 4888888888:::888")
        @@prompt.warn(":::::888888888888P _.-|        .-~ | ~-.             |-._ 488888:::888")
        @@prompt.warn(":::::888888888P _-|            |   |   |                 |-_ 488::8888")
        @@prompt.warn("::::::888888P ,'               |  _:_  |                    .-:~--.._8")
        @@prompt.warn("8:::::88888 ,'            .  .-|~~ | ~~|-.                .~  |      |")
        @@prompt.warn("88:::::88P /_.-~:.   .   :   |     |     |       .        |   |      |")
        @@prompt.warn("888::::8P /|    | `.o    !   |     |     |        :       |   |      |")
        @@prompt.warn(" _..--~:-. |    |  |         |     |     |                |   |      |")
        @@prompt.warn(" |      |  ~.   |  |         |  __.:.__  |                |   |      |")
        @@prompt.warn(" |      |   |   |  |       .-|~~   |   ~~|-.              |   |      |")
        @@prompt.warn(" |      |   |  _|.--~:-.   |       |       |         .:~-.|   |      |")
        @@prompt.warn(" |      |   | |      |  ~. |       |   _.-:~--._   .' |   |   |      |")
        @@prompt.warn(" |      |   | |      |   | |       |  |   |     |  |  |   |   |      |")
        @@prompt.warn(" |      |   | |      |   | |       |  |   |     |  |  |   |   |      |")
        @@prompt.warn(" |      |   | |      |   | |       |  |   |     |  |  |   |   |      |")
        @@prompt.warn(" |      |   | |      |   | |       |  |   |     |  |  |   |   |      |")
        @@prompt.warn(" |      |   | |      |   | |       |  |   |     |  |  |   |   |      |")
        @@prompt.warn("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
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
        puts "#{self.name.upcase}!!! IT'S #{self.important_person}. I RAN OUT OF TOILET PAPER!"
        puts "PLEASE BE A KIND SOUL AND BRING ME SOME?"
        puts "                                                                      "
        sleep(2)
        self.pick_item

end

def see_a_friend 
    system("clear")
    @@prompt.warn("                      ____..     ")
    puts " "
    @@prompt.warn("             .--=-====.__    .    ")
    puts " "
    @@prompt.warn("            |            `    |    ")
    puts " "
    @@prompt.warn("  (         `._....------.._.:     ")
    puts " "
    @@prompt.warn("   )         .()''        ``()    ")
    puts " "
    @@prompt.warn("  '          () .=='  `===  `   ")
    puts " "
    @@prompt.warn("   . )       (  (o     g)   )       ")
    puts " "
    @@prompt.warn("   (          |.   /      . (      ")
    puts " "
    @@prompt.warn("   $$         (.  (_'.   , )|`     ")
    puts " "
    @@prompt.warn("   ||         |)`-....--'/  ' l    ")
    puts " "
    @@prompt.warn("  /||.         () | | | /  /   l.  ")
    puts " "
    @@prompt.warn(" //||(          l`-===-'  '     lo. ")
    puts " "
    @@prompt.warn(".//7' |)         `. --   l      OObaaaad888b. ")
    puts " "
    @@prompt.warn("(<<. / |     .a888b`.__.'d      OO888888888888a. ")
    puts " "
    @@prompt.warn(" \  Y' |    .8888888aaaa88POOOOOO888888888888888.  ")
    puts " "
    @@prompt.warn("   |   |  .d88888P88888888888888888888888b8888888.  ")
    puts " "
    @@prompt.warn("   b.--d .d88888P8888888888888888a:f888888|888888b  ")
    puts " "
    @@prompt.warn("   88888b 888888|8888888888888888888888888\8888888  ")
    puts " "
    puts " "
    puts "NAVIGATING YOUR WAY THROUGH THE EMPTY STREETS YOU SEE A FAMILIAR FACE"
    sleep(2)
    puts " "
    puts "IT'S YOUR FRIEND GREG WAVING AT YOU FROM ACCROSS THE STREET"
    sleep(2)
    puts " "
    choices = ["SPRAY LYSOL IN HIS DIRECTION AND RUN AWAY", "SMILE AND WAVE FROM A FAR", "HE LOOKS HEALTHY! CROSS THE STREET AND SAY HELLO."]
    response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
    sleep(2)
    puts " "
    case response[0]
    when "SPRAY LYSOL IN HIS DIRECTION AND RUN AWAY"
        puts "TAKE THAT GREG! YOU ADVANCE WITH NO HEALTH POINTS DEDUCTED"
    when "SMILE AND WAVE FROM A FAR"
        puts "GOOD WORK! NO HEALTH POINTS DEDUCTED"
    when "HE LOOKS HEALTHY! CROSS THE STREET AND SAY HELLO."
        puts "HE IS HAPPY TO SEE YOU AN OFFERS YOU A CIGARETTE"
        puts " "
        choices = ["GREAT! THIS TRIP HAS BEEN STRESSFUL I COULD REALLY USE ONE.", "NO THANK YOU, GREG!"]
        response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
        puts " "
        sleep(1)
        if response[0] == "GREAT! THIS TRIP HAS BEEN STRESSFUL I COULD REALLY USE ONE."
            puts "YOU HAVE COME IN CONTACT WITH THE VIRUS. LOSE 5 HEALTH POINTS."
            self.hp -= 5
        else 
            puts "YOU HAVE AVOIDED DIRECT INFECTION BUT HE MAY STILL BE CARRYING THE VIRUS. LOSE 3 HEALTH POINTS."
            self.hp -= 3
        end 

    end 
    sleep(1)
    puts " "
    puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
    sleep(3)
    self.death_status
end 

def see_a_cute_dog 
    system("clear")
    sleep(2)
    @@prompt.warn ("          ____")
    @@prompt.warn ("       ,--,  `---._")
    @@prompt.warn ("_______(0} `, , ` , )")
    @@prompt.warn ("V           ; ` , ` (                            ,•~~~~~~`,")
    @@prompt.warn ("`.____,- •  (,  `  , )                          :`,-•**`. *;")
    @@prompt.warn ("  `-------._);  ,  ` `,                         (;:      )``:")
    @@prompt.warn ("         )  ) ; ` ,,  :                          ``      : •;")
    @@prompt.warn ("        (  (`;:  ; ` ;:                                  ;;;,")
    @@prompt.warn ("        (:  )``;:;;)`•`•`--.    _____     ____       _,-•;;`")
    @@prompt.warn ("        :`  )`;)`)`•   :    ^~~~     ~~~~~    ~~~`--^,.;;;^")
    @@prompt.warn ("        `--;~~~~~      `  ,  ^, ^^^,  ^  ^   ^` ^,, ^ ;``")
    @@prompt.warn ("          (; ; ;      `                   ,`       ` :")
    @@prompt.warn ("           (; /            ;   ;          ` ;     ; :")
    @@prompt.warn ("           ;(_; ;  :   ; ; `; ;` ; ; ,,,^^^;}     `;")
    @@prompt.warn ("           : `; `; `  :  `  `,,;,••••   );;`);     ;")
    @@prompt.warn ("           |, `;; ,``                  `)`; `(; `  `;")
    @@prompt.warn ("           ;  ;;  ``:                   `).:` (;,   `.")
    @@prompt.warn ("        ,-•   ;`;;:;`                   ;;•`;;  `)   )")
    @@prompt.warn ("         ~~~,-`;`;,)                    ~~~~~  ,-•   ;")
    @@prompt.warn ("            ^^^^^^                             `^^^^^^")  
    puts " "
    puts "YOU SEE A CUTE DOG ON THE STREET WAGGING HER TAIL"
    puts " "
    sleep(2)
    puts "SHE IS ON A LEASH AT LEAST SIX FEET FROM HER OWNER"
    puts " "
    sleep(2)
  
  choices = ["GO OVER AND PET HER!", "BEND DOWN AND LET HER LICK YOUR FACE", "CROSS THE STREET."]
  response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
   sleep(2)
   puts " "
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
  sleep(1)
  puts " "
  puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
  sleep(3)
  self.death_status
end 




def encounter_hobo
    system("clear")
    @@prompt.warn("                 ^^^^^^^^")
    @@prompt.warn("                (         )")
    @@prompt.warn("               ((         ))")
    @@prompt.warn("               (___)   (___)")
    @@prompt.warn("               ( 0       0 )            ,-,")
    @@prompt.warn("   ,.          (|   * *   |)        ,-./ /")
    @@prompt.warn(" _ | |         (           )        | `- `--.")
    @@prompt.warn("( `* (_/|__     |  =====  /       ,-*     ,-)")
    @@prompt.warn(";         )    ,|`.  - , |.      `-.   ) |")
    @@prompt.warn("| (    ,-*   _/ `-.`-- ,-  |---.   /      ;")
    @@prompt.warn("|     |   ,-*  |  /---- |  |   |--/       |")
    @@prompt.warn("|     |_,|    /     |     /|   |          |")
    @@prompt.warn("|     `  |   |      |       |  /        ,*")
    @@prompt.warn("|         |  |      |       | /      _,*")
    @@prompt.warn(":          | ,      |       `/------*")
    @@prompt.warn("`-.___,---*)        |       `.")
    puts " "
    puts "AS YOU CONTINUE DOWN THE BLOCK, YOU SEE A HOMELESS MAN COMING YOUR WAY."
    puts "                                               "
    sleep(1) 
    choices = ["USE PANIC CRY!", "SPRAY HIM WITH LYSOL AND RUN!"]
    response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
    puts "                                                "
    sleep(1)
    if response[0] == "USE PANIC CRY!"
        if self.panic_cry == "HELP!"
            self.hp -= 2
            puts "#{self.name}: HELP!"
            puts " "
            puts "THE HOBO TRIES TO COVER YOUR MOUTH BUT YOU MANAGE TO ESCAPE AND RUN AWAY. (LOSE 2 HEALTH POINTS)"
            sleep(3)
        elsif self.panic_cry == "GET A JOB!"
            self.hp -= 5
            puts "#{self.name}: GET A JOB!"
            puts " "
            puts "THE HOBO GETS ANGRY AND SPITS ON YOU. (LOSE 5 HEALTH POINTS)"
            sleep(3)
        elsif self.panic_cry == "(COUGH, COUGH)"
            self.hp -= 1
            puts "#{self.name}: (COUGH,COUGH)"
            puts " "
            puts "THE HOBO BECOMES AFRAID THAT YOU MIGHT HAVE COVID-19 AND WALKS PAST YOU. (LOSE 1 HEALTH POINT)"
            sleep(3)
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
        puts " "
        puts " "
        @@prompt.select("EXIT GAME", ["EXIT"])
        sleep(30)    
    end

end

    # def start_story
    #     system("clear")
    #     puts ":::888888888888888888888888888888888888***8888888888888888888888::::88"
    #     puts "::::8888888888888888888888P   ____.------.____   488888888888888:::888"
    #     puts "::::88888888888888888P __.--||    _._         ||--.__ 4888888888:::888"
    #     puts ":::::888888888888P _.-|        .-~ | ~-.             |-._ 488888:::888"
    #     puts ":::::888888888P _-|            |   |   |                 |-_ 488::8888"
    #     puts "::::::888888P ,'               |  _:_  |                    .-:~--.._8"
    #     puts "8:::::88888 ,'            .  .-|~~ | ~~|-.                .~  |      |"
    #     puts "88:::::88P /_.-~:.   .   :   |     |     |       .        |   |      |"
    #     puts "888::::8P /|    | `.o    !   |     |     |        :       |   |      |"
    #     puts " _..--~:-. |    |  |         |     |     |                |   |      |"
    #     puts " |      |  ~.   |  |         |  __.:.__  |                |   |      |"
    #     puts " |      |   |   |  |       .-|~~   |   ~~|-.              |   |      |"
    #     puts " |      |   |  _|.--~:-.   |       |       |         .:~-.|   |      |"
    #     puts " |      |   | |      |  ~. |       |   _.-:~--._   .' |   |   |      |"
    #     puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
    #     puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
    #     puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
    #     puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
    #     puts " |      |   | |      |   | |       |  |   |     |  |  |   |   |      |"
    #     puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    #     puts "                                                                      "
    #     puts "                                                                      "
    #     puts "THE YEAR... 2020. THE PLACE... NEW YORK CITY."
    #     puts "                                                                      "
    #     sleep(2)
    #     puts "IT'S DAY 187 SINCE THE COVID-19 PANDEMIC BEGAN."
    #     puts "                                                                      "
    #     sleep(2)
    #     puts "YOU WAKE UP IN YOUR BED TO THE SOUND OF A RINGING TELEPHONE."
    #     puts "                                                                      "
    #     sleep(2)
    #     puts "#{self.name.upcase}: HELLO?"
    #     puts "                                                                      "
    #     sleep(2)
    #     puts "#{self.name.upcase}!!! IT'S [insert person]. I RAN OUT OF TOILET PAPER!"
    #     puts "PLEASE BE A KIND SOUL AND BRING ME SOME?"
    #     puts "                                                                      "
    #     sleep(5)
    # end
end
