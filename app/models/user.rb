require 'pry'
class User < ActiveRecord::Base
    has_many :characters
    has_many :purells
    has_many :face_masks
    has_many :rubber_gloves
    has_many :lysols 
    @@prompt = TTY::Prompt.new

    def age_prob
        case self.character_type
        when "TEEN"
           see_a_friend
           see_a_cute_dog
           encounter_hobo
           drop_item
        #    your_a_teen
        when "SENIOR"
            see_a_cute_dog
            encounter_hobo
            drop_item
            your_a_senior
        when "ADULT"
            see_a_friend
            encounter_hobo
            drop_item
            your_an_adult
        end
    end



    def hp_check
        if self.hp < 1
            sleep(3)
            self.death_status
        else
            puts " "
            sleep(2)
            puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
            sleep(3)
        end
    end



    # def your_a_teen
    #     system("clear")
    #     @@prompt.warn("|#######====================#######|")
    #     @@prompt.warn("|#(5)*UNITED STATES OF AMERICA*(5)#|")
    #     @@prompt.warn("|#**          {===}   ********  **#|")
    #     @@prompt.warn("|*# {G}      { (G) }             #*|")
    #     @@prompt.warn("|#*  ******  | (W) |   F I V E   *#|")
    #     @@prompt.warn("|#(5)         {===}            (5)#|")
    #     @@prompt.warn("|##========FIVE DOLLARS==========##|")
    #     @@prompt.warn("------------------------------------")
    #     puts "  "
    #     puts "  "
    #     sleep(2)
    #     puts "TOILET PAPER IS LAME. WHY DOES #{self.important_person} EVEN NEED IT?"
    #     puts "  "
    #     sleep(2)
    #     puts "YOU REACH INTO YOUR POCKET AND PULL OUT A COUPLE 5 DOLLAR BILLS"
    #     puts "  "
    #     sleep(2)
    #     puts "HOW MUCH DOES TOILET PAPER COST?"
    #     puts " "
    #     sleep(2)
    #     choices = ["STOP AT THE CANDY STORE AND BUY 015 WORTH OF CANDY", "CONTINUE TO THE STORE, YOU CAN GET CHIPS WHILE YOU'RE THERE", "STOP AT YOUR FAV SANDWHICH SHOP FOR PICKUP, YOUVE GOT JUST ENOUGH MONEY FOR A SANDWHICH!"]
    #     response = @@prompt.multi_select("YOU'RE SUDDENLY FEELING SUPER HUNGRY. WHAT DO YOU DO?", choices, min: 1, max: 1)
    #     puts "  "
    #     case response[0]

    #     when "STOP AT THE CANDY STORE AND BUY 015 WORTH OF CANDY"
    #         puts "THE CANDY STORE IS CLOSED AND THE OTHER TEENS STANDING OUTSIDE ARE CARRYING THE VIRUS"
    #         sleep(2)
    #         puts "  "
    #         puts "ONE OF THEM SNEEZES ON YOU. LOSE 4 HEALTH POINTS"
    #         puts " "
    #         sleep(2)
    #         self.hp -= 4 

    #     when "CONTINUE TO THE STORE, YOU CAN GET CHIPS WHILE YOU'RE THERE"
    #         puts "NICE JOB! NO HEALTH POINTS DEDUCTED"
    #         sleep(2)

    #     when "STOP AT YOUR FAV SANDWHICH SHOP FOR PICKUP, YOUVE GOT JUST ENOUGH MONEY FOR A SANDWHICH!"
    #         puts "YOUR SANDWHICH IS DELICIOUS BUT YOUVE FAILED TO GET #{self.important_person} TOILET PAPER"
    #         sleep(2)
    #         puts " "
    #         self.hp -= 15 

    #     end 
    #     self.hp_check
    # end 


    def your_a_senior
        system("clear")
        puts "YOU'RE SO TIRED"
        puts " "
        sleep(2)
        puts "WHY CAN'T THEY GET TOILET PAPER THEMSELVES?"
        puts " "
        sleep(2)
        choices = ["GO BACK HOME AND ORDER TOLIET PAPER ON AMAZON TO BE DELIVERED TO THIER PLACE", "KEEP GOING, YOU'LL NAP LATER"]
        response = @@prompt.multi_select("WHAT DO YOU DO?", choices, min: 1, max: 1)
        
        case response[0]

        when "GO BACK HOME AND ORDER TOLIET PAPER ON AMAZON TO BE DELIVERED TO THIER PLACE"
            puts "YOU'RE SO TIRED, YOU JUST NEED TO SIT DOWN"
            puts " "
            puts "YOU MAKE A QUICK LEFT INTO THE PARK."
            sleep(2)
            puts " "
            puts "THE PARK IS PACKED, WHICH MEANS THE VIRUS IS EVERYTWHERE."
            puts " "
            sleep(2)
            puts "YOU PULL OUT YOUR PHONE TO ORDER THE TOILET PAPER, VIRUS GETS ALL OVER THE PHONE. LOSE 10 HEALTH POINTS."
            sleep(2)
            self.hp -= 10 

        when "KEEP GOING, YOU'LL NAP LATER"
            puts " "
            puts "YOUR PERSISTANCE IS ADMIRABLE. NO HEALTH POINTS DEDUCTED"
            sleep(2)
        end 
        self.hp_check
    end 

    def your_an_adult 
        system("clear")
        puts "YOU GET ANOTHER CALL FROM #{self.important_person}"
        sleep(2)
        puts " "
        puts "THEY JUST TESTED POSITIVE FOR THE VIRUS."
        puts "  "
        sleep(2)
        choices = ["GET YOUR TOILET PAPER AND GO SEE THEM IMMIDATELY", "CALL A FRIEND TO SEE IF YOU CAN HIDEOUT AT THIER HOUSE UNTIL YOUR #{self.important_person} IS BETTER"]
        response = @@prompt.multi_select('WHAT DO YOU DO?', choices, min: 1, max: 1)
        puts "  "
        sleep(2)
        case response[0]
        when "GET YOUR TOILET PAPER AND GO SEE THEM IMMIDATELY"
            if self.face_mask != nil 
                puts " "
                puts "GOOD THING YOU HAVE A FACEMASK! NO HEATLH POINTS DEDUCTED"
                sleep(2)
            elsif self.rubber_glove != nil 
                puts " "
                puts "YOU MAKE A FACEMASK OUT OF YOUR SCARF"
                sleep(2)
                puts " "
                sleep(2)
                puts "NO HEALTH POINTS DEDUCTED"
            elsif self.purell != nil 
                puts "  "
                puts "UNFORTUNATELY YOU ONLY GRABBED PURELL ON YOUR WAY OUT"
                sleep(2)
                puts " "
                puts "PURELL ALONE IS NOT ENOUGH TO STOP THE VIRUS"
                sleep(2)
                puts " "
                puts "SIX HEALTH POINTS DEDUCTED"
                self.hp -= 6
            end 

        when "CALL A FRIEND TO SEE IF YOU CAN HIDEOUT AT THIER HOUSE UNTIL YOUR #{self.important_person} IS BETTER"
            puts "  "
            puts "YOUR FRIEND TELLS YOU THERE IS NO WAY YOU CAN STAY WITH HER DURING QUARATINE"
            sleep(2)
            puts " "
            puts "DEFEATED, YOU MAKE A QUICK LEFT INTO THE PARK."
            sleep(2)
            puts " "
            puts "THE PARK IS PACKED, WHICH MEANS THE VIRUS IS EVERYWHERE"
            sleep(2)
            puts " "
            puts "LOSE 8 HEALTH POINTS "
            sleep(2)
             self.hp -= 8 
        end 
        self.hp_check
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
        puts " "
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
            person = User.create( name: username.upcase, hp: 10, panic_cry: panicCry[0], character_type: "TEEN", important_person: "YOUR GRANDMOTHER")
        elsif char[0] == "SENIOR"
            person = User.create( name: username.upcase, hp: 5, panic_cry: panicCry[0], character_type: "SENIOR", important_person: "YOUR ELDERLY MOTHER")
        elsif char[0] == "ADULT"
            person = User.create(name: username.upcase, hp: 7, panic_cry: panicCry[0], character_type: "ADULT", important_person: "YOUR DISABLED ADULT CHILD")
        end
    end


    def start_story
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
        sleep(2)
        puts "THE YEAR... 2020. THE PLACE... NEW YORK CITY"
        puts "                                                                      "
        sleep(2)
        puts "IT'S DAY 187 SINCE THE COVID-19 PANDEMIC BEGAN"
        puts "                                                                      "
        sleep(2)
        puts "YOU WAKE UP IN YOUR BED TO THE SOUND OF A RINGING TELEPHONE"
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


    def pick_item 
        puts "YOU WANDER OUT OF BED AND PUT ON SOME SWEATPAINTS"
        puts " "
        sleep(2)
        puts "THERE ARE THREE ITEMS ON YOUR KITCHEN TABLE"
        puts " "
        sleep(2)
        choices = ["PURELL", "RUBBER GLOVES", "FACE MASK"]
        response = @@prompt.multi_select('WHAT DO YOU GRAB BEFORE LEAVING THE HOUSE?', choices, min: 1, max: 1)
        sleep(2)
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
      puts " "
      puts "YOU GRAB IT AND LEAVE!"
      puts " "
      sleep(2)
    end 


    def purrell_prob
        puts "YOU PUT ON YOUR SHOES AND WIPE DOWN THE DOOR HANDLE ON YOUR WAY OUT"
        puts " "
        sleep(2)
        choices = ["APPLY MY PURELL!", "NO NEED FOR PURELL, I JUST WIPED DOWN THE DOOR HANDLE"]
        response = @@prompt.multi_select('WHAT IS YOUR NEXT MOVE?', choices, min: 1, max: 1)
        puts " "
        sleep(2)
        case response[0]
        when "APPLY MY PURELL!"
            apply_purell
        when "NO NEED FOR PURELL, I JUST WIPED DOWN THE DOOR HANDLE"
            puts "THOUGH THAT MAY BE TRUE, YOU STILL RISK CROSS CONTAMINATION"
            puts "  "
            sleep(2)
            puts "FOUR HEATLH POINTS DEDUCTED"
            self.hp -= 4 
            self.hp_check 
        end 
    end 

    def rubber_glove_prob
        puts "DONT FORGET TO TAKE OFF YOUR GLOVES BEFORE SEEING #{self.important_person}"
        puts " "
        sleep(2)
        puts "NO HEATLH POINTS DEDUCTED"
        self.hp_check 
    end 


    def face_mask_problem
        puts "YOUR FACE MASK IS NOT COMFORTABLE"
        puts " "
        sleep(2)
        choices = ["NOTHING, IM NOT WEARING GLOVES", "ADJUST IT! IM GOING TO NEED TO WEAR THIS THE WHOLE TRIP!"]
        response = @@prompt.multi_select('WHAT DO YOU DO?', choices, min: 1, max: 1)
        puts " "
        sleep(2)
        case response[0]
        when "NOTHING, IM NOT WEARING GLOVES"
            puts "GOOD THINKING. NO HEALTH POINTS DEDCUTED"
        when "ADJUST IT! IM GOING TO NEED TO WEAR THIS THE WHOLE TRIP!"
            puts "IF THE VIRUS WAS ON YOUR HANDS YOUR FACE MASK WOULD BE RENDERED USELESS. LOSE 4 HEALTH POINTS"
            self.hp -= 4 
        end 
        self.hp_check 
    end 


    def item_problem 
        if self.purell != nil 
             purrell_prob
        elsif self.rubber_glove != nil 
            rubber_glove_prob

        elsif self.face_mask != nil
            face_mask_problem
        end 
    end 


    
    def apply_purell
        if self.purell 
            puts "YOU USED YOUR PURELL. ADD 2 HEALTH POINTS"
            self.hp += 2
            sleep(3)
        end 
    end 


    def drop_pur 
        puts " "
        puts "YOU PULL OUT YOUR PURELL AND ACCIDENTLY DROP IT RIGHT ABOVE THE SEWER GRATE"
        puts " "
        sleep(2)
        choices = ["HELL NO, ITS SO DIRTY!", "SURE, WHAT ARE THE CHANCES CARONAVIRUS HAS MADE IT TO THIS SEWER", "ILL JUST BUY MORE LATER"]
        response = @@prompt.multi_select("DO YOU PICK IT UP?", choices, min: 1, max: 1)
        puts " "
        sleep(2)
          case response[0]
          when "HELL NO, ITS SO DIRTY!"
            puts "LOOSE 2 HEALTH POINTS"
            self.purell = nil 
            self.hp -= 2
          when "SURE, WHAT ARE THE CHANCES CARONAVIRUS HAS MADE IT TO THIS SEWER"
            puts "GOOD WORK, NO HEALTH POINTS DEDUCETED"
            puts "  "
            sleep(2)
            choices = ["RE-APPLY MY PURELL", "NOPE, LETS GO!"]
            response = @@prompt.multi_select("ANYTHING ELSE", choices, min: 1, max: 1)
            puts " "
            case response[0]
            when "RE-APPLY MY PURELL"
                apply_purell
            when "NOPE, LETS GO!"
                puts "GROSS, LOOSE 1 HEALTH POINT"
                self.hp -= 2 
                self.hp_check
            end 
            when "ILL JUST BUY MORE LATER"
                puts "EVERYONE IS OUT OF PURELL"
                puts " "
                sleep(2)
                puts "LOOSE 2 HEALTH POINTS"
                self.purell = nil 
                self.hp -= 2
                self.hp_check
          end 
       end 


       def drop_item
        if self.purell != nil 
            self.drop_pur
        end 
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
        @@prompt.warn("   00         (.  (_'.   , )|`     ")
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
        sleep(2)
        puts "NAVIGATING YOUR WAY THROUGH THE EMPTY STREETS YOU SEE A FAMILIAR FACE"
        sleep(2)
        puts " "
        puts "IT'S YOUR FRIEND GREG WAVING AT YOU FROM ACCROSS THE STREET"
        puts " "
        sleep(2)
        choices = ["SPRAY LYSOL IN HIS DIRECTION AND RUN AWAY", "SMILE AND WAVE FROM A FAR", "HE LOOKS HEALTHY! CROSS THE STREET AND SAY HELLO"]
        response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
        sleep(2)
        puts " "
        case response[0]
        when "SPRAY LYSOL IN HIS DIRECTION AND RUN AWAY"
            puts "TAKE THAT GREG! SMOKERS ARE GROSS! YOU ADVANCE WITH NO HEALTH POINTS DEDUCTED"
        when "SMILE AND WAVE FROM A FAR"
            puts "GOOD WORK! NO HEALTH POINTS DEDUCTED"
        when "HE LOOKS HEALTHY! CROSS THE STREET AND SAY HELLO"
            puts "HE IS HAPPY TO SEE YOU AN OFFERS YOU A CIGARETTE"
            puts " "
            choices = ["GREAT! THIS TRIP HAS BEEN STRESSFUL I COULD REALLY USE ONE", "NO THANK YOU, GREG!"]
            response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
            puts " "
            sleep(1)
            if response[0] == "GREAT! THIS TRIP HAS BEEN STRESSFUL I COULD REALLY USE ONE"
                puts "GREG DID NOT HAVE THE VIRUS BUT SMOKING IS A NASTY HABIT. LOSE 5 HEALTH POINTS"
                self.hp -= 5
            else 
                puts "YOU HAVE AVOIDED DIRECT INFECTION BUT YOU LOSE 3 HEALTH POINTS FOR SECOND-HAND SMOKING"
                self.hp -= 3
            end 
    
        end 
        self.hp_check
    end 


    def see_a_cute_dog 
        system("clear")
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
        @@prompt.warn ("           ;  ;;  ``:                   `).:` (;,   `")
        @@prompt.warn ("        ,-•   ;`;;:;`                   ;;•`;;  `)   )")
        @@prompt.warn ("         ~~~,-`;`;,)                    ~~~~~  ,-•   ;")
        @@prompt.warn ("            ^^^^^^                             `^^^^^^")  
        puts " "
        sleep(2)
        puts "YOU SEE A CUTE DOG ON THE STREET WAGGING HER TAIL"
        puts " "
        sleep(2)
        puts "SHE IS ON A LEASH AT LEAST SIX FEET FROM HER OWNER"
        puts " "
        sleep(2)
      
      choices = ["GO OVER AND SAY HI!", "BEND DOWN AND PET HER", "CROSS THE STREET"]
      response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
       sleep(2)
       puts " "
      case response[0]
      when "GO OVER AND SAY HI!"
        puts "YOU AVOIDED PETTING THE DOG BUT UNFORNATELY SHE GOT OVERLY EXCITED AND PEED ON YOU. LOSE 4 HEALTH POINTS"
        sleep(2)
        self.hp -= 4
      when "BEND DOWN AND PET HER"
        puts "THE DOG IS HAPPY TO SEE YOU AND LICKS YOUR FACE"
        puts " "
        sleep(2)
        puts "UNFORTUNATELY IS CARRYING THE VIRUS"
        puts " "
        sleep(2)
        @@prompt.error("YOU'VE CONTRACTED THE VIRUS!")
        sleep(2)
        self.hp -= 40 
      when "CROSS THE STREET"
        puts "GOOD WORK! HER OWNER IS INFECTED WITH THE VIRUS. NO HEALTH POINTS DEDUCTED"
      end 
      self.hp_check
    end 


    def encounter_hobo
        system("clear")
        @@prompt.warn("                 ^^^^^^^^")
        @@prompt.warn("                (         )")
        @@prompt.warn("               ((         ))")
        @@prompt.warn("               (___)   (___)")
        @@prompt.warn("               ( 0       0 )            ,-,")
        @@prompt.warn("   ,.          (|   * *   |)        ,-./ /")
        @@prompt.warn(" _ | |         (           )        | `- `--")
        @@prompt.warn("( `* (_/|__     |  =====  /       ,-*     ,-)")
        @@prompt.warn(";         )    ,|`.  - , |.      `-.   ) |")
        @@prompt.warn("| (    ,-*   _/ `-.`-- ,-  |---.   /      ;")
        @@prompt.warn("|     |   ,-*  |  /---- |  |   |--/       |")
        @@prompt.warn("|     |_,|    /     |     /|   |          |")
        @@prompt.warn("|     `  |   |      |       |  /        ,*")
        @@prompt.warn("|         |  |      |       | /      _,*")
        @@prompt.warn(":          | ,      |       `/------*")
        @@prompt.warn("`-.___,---*)        |       `")
        puts " "
        sleep(2)
        puts "AS YOU CONTINUE DOWN THE BLOCK, YOU SEE A HOMELESS MAN APPROACHING YOU AT FULL SPEED"
        puts " "
        sleep(2)
        puts "HE IS CLEARLY ANGRY AT THE WORLD AND WANTS TO TAKE IT OUT ON YOU"
        puts " "
        sleep(2) 
        choices = ["USE PANIC CRY!", "SPRAY HIM WITH LYSOL AND RUN!"]
        response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)
        puts "                                                "
        sleep(2)
        if response[0] == "USE PANIC CRY!"
            puts "#{self.name}: #{self.panic_cry}"
            puts "  "
            sleep(2)
            case self.panic_cry
            when "HELP!"
                puts "HE TRIES TO COVER YOUR MOUTH BUT YOU MANAGE TO ESCAPE AND RUN AWAY. LOSE 4 HEALTH POINTS"
                self.hp -= 4
                sleep(2)
            when "GET A JOB!"
                puts "HE STOPS AND EXPLAINS THAT HE IS ACTUALLY A RHODES SCHOLAR AND HIS LIFE CHOICES ARE NON OF YOUR CONCERN"
                puts " "
                sleep(2)
                puts "NO HEALTH POINTS DEDUCTED AND YOU LEARN A VALUABLE LESSON"
                sleep(2)
            when "(COUGH, COUGH)"
                puts "HE BECOMES AFRAID THAT YOU MIGHT HAVE THE VIRUS AND KNOCKS YOU OVER. LOSE 1 HEALTH POINT"
                sleep(2)
                self.hp -= 1
            end
        else
            puts "HE GASPS AND YOU MAKE A CLEAN GETAWAY. NO HEALTH POINTS DEDUCTED"
        end
        self.hp_check
    end    


    def item_problem_before_store 
        system("clear")
        @@prompt.warn("              (#############)")
        @@prompt.warn("             (###############)")
        @@prompt.warn("              (#############)")
        @@prompt.warn("               (###########)")
        @@prompt.warn("                (#########)")
        puts " "
        @@prompt.warn("                  (######)")
        @@prompt.warn("                 (########)")
        @@prompt.warn(" (###########)    (#######)   (###########)")
        @@prompt.warn(" (############)    (#####)   (############)")
        @@prompt.warn("  (###########)              (###########)")
        @@prompt.warn("   (#########)                (#########)")
        @@prompt.warn("    (#######)                  (#######)")
        @@prompt.warn("     (#####)                    (#####)")
        sleep(2)
        puts " "
        puts " "
        puts "YOU APPROACH THE STORE..."
        puts "  "
        sleep(2)
        puts "THERE IS A LINE AND A MAN IN A HAZMAT SUIT LETTING PEOPLE IN ONE AT A TIME"
        puts "  "
        if self.purell != nil 
            sleep(2)
            puts "YOU TAKE YOUR PLACE IN LINE TRYING TO STAY 6 FEET AWAY FROM THE PERSON IN FRONT OF YOU"
            puts " "
            choices = ["APPLY MY PURELL!", "OFFER YOUR PURELL TO THE STRANGERS IN FRONT OF YOU"]
            response = @@prompt.multi_select('WHAT DO YOU DO?', choices, min: 1, max: 1)
            puts " "
            sleep(2)
            case response[0]
            when "APPLY MY PURELL!"
                apply_purell
            when "OFFER YOUR PURELL TO THE STRANGERS IN FRONT OF YOU"
                puts "HI! I'M #{self.name}. WOULD YOU LIKE SOME OF MY HAND SANITIZER?"
                puts " "
                puts "A STRANGER THANKS YOU BY TOUCHING YOUR ARM AND GIVES YOU THE VIRUS"
                puts " "
                @@prompt.error("YOU'VE CONTRACTED THE VIRUS!")
                sleep(2)
                self.hp -= 40
            end 
        elsif self.rubber_glove != nil 
            sleep(2)
            puts "THE PERSON IN FRONT OF YOU IS COUGHING"
            puts " "
            sleep(2)
            choices = ["RUN THE OTHER WAY", "TURN YOUR SCARF INTO A MASK"]
            response = @@prompt.multi_select('WHAT DO YOU DO?', choices, min: 1, max: 1)
            case response[0]
            when "RUN THE OTHER WAY"
                puts " "
                puts "GOOD THINKING! YOU HAVE AVOIDED THE VIRUS BUT FAILED TO BRING YOUR #{self.important_person} TOILET PAPER"
                puts " "
                sleep(2)
                self.hp -= 70 

            when "TURN YOUR SCARF INTO A MASK"
                puts " "
                puts "SMART MOVE! YOU'VE PROTECTED YOURSELF FROM CATCHING THE VIRUS NO HEALTH POINTS DEDUCTED"
                sleep(2)
                puts " "
                puts "CURRENT HEALTH: #{self.hp}" 
                sleep(3)
            end 

        elsif self.face_mask != nil
            sleep(2)
            puts "GOOD THING YOUR FACE IS PROTECTED"
            puts " "
            choices = ["POCKETS!!!", "WHO CARES? I HAVE A FACE MASK"]
            response = @@prompt.multi_select('WHAT DO YOU DO? WITH YOUR HANDS', choices, min: 1, max: 1)
            puts " "
            sleep(2)
            case response[0]
            when "POCKETS!!!"
                puts "GOOD THINKING. NO HEALTH POINTS DEDCUTED"
            when "WHO CARES? I HAVE A FACE MASK"
                puts "TRUE... BUT THE VIRUS GETS ON YOUR HANDS AND YOU SPREAD IT TO #{self.important_person}"
                puts " "
                @@prompt.error("YOU'VE CONTRACTED THE VIRUS!")        
                self.hp -= 40
            end 
        else
            sleep(2)
            puts "UNFORTUNATELY, YOU DON'T HAVE PURELL TO SANITIZE YOUR HANDS. LOSE 1 HEALTH POINT."
            self.hp -= 1
        end 
        self.hp_check
        self.buying_toilet_paper 
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
        sleep(2)
        puts "FINALLY #{self.name.upcase}! YOU HAVE MADE IT TO THE DELI"
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
     sleep(2)
    case paper[0]
    when "SINGLE PLY"
        puts " "
        puts "YOUR #{self.important_person} IS GOING TO LOVE IT!"
        self.winner
        #holding up toilet paper art?
    when "FANCY CHARMIN"
        puts " "
        puts "YOU PICK UP THE TOILET PAPER BUT THE BODEGA CAT HAS ALREADY GOTTEN TO IT"
        puts " "
        sleep(2)
        puts "YOU SNEEZE AND ACCIDENTALLY TOUCH YOUR FACE"
        puts " "
        @@prompt.error("YOU'VE CONTRACTED THE VIRUS!")
        self.hp -= 40
        self.hp_check
    when "BODEGA BRAND RECYLEABLE"
        puts " "
      puts "ODD CHOICE BUT HEY, BEGGERS CAN'T BE CHOOSERS!"
      self.winner
      #holding up toilet paper art?
     end
   end 




    




def death_status
    system("clear")
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


def winner
    system("clear")
    sleep(2)
    puts " "
    puts " "
    @@prompt.ok(" /00     /00 /000000  /00   /00 /00 /00    /00 /00000000      /00      /00  /000000  /00   /00     /00 /00 /00")
    @@prompt.ok("|  00   /00//00__  00| 00  | 00| 0/| 00   | 00| 00_____/     | 00  /0 | 00 /00__  00| 000 | 00    | 00| 00| 00")
    @@prompt.ok(" l  00 /00/| 00  l 00| 00  | 00|_/ | 00   | 00| 00           | 00 /000| 00| 00  l 00| 0000| 00    | 00| 00| 00")
    @@prompt.ok("  l  0000/ | 00  | 00| 00  | 00    |  00 / 00/| 00000        | 00/00 00 00| 00  | 00| 00 00 00    | 00| 00| 00")
    @@prompt.ok("   l  00/  | 00  | 00| 00  | 00     l  00 00/ | 00__/        | 0000_  0000| 00  | 00| 00  0000    |__/|__/|__/")
    @@prompt.ok("    | 00   | 00  | 00| 00  | 00      l  000/  | 00           | 000/ l  000| 00  | 00| 00l  000                ")
    puts " "
    @@prompt.ok("    | 00   |  000000/|  000000/       l  0/   | 00000000     | 00/   l  00|  000000/| 00 l  00     /00 /00 /00")
    @@prompt.ok("    |__/    l______/  l______/         l_/    |________/     |__/     l__/ l______/ |__/  l__/    |__/|__/|__/")
    puts " "
    puts " "
    @@prompt.ok("    .--.----------------.")
    @@prompt.ok("    /    l  l l l l l l l l")
    @@prompt.ok("   /      l                l")
    @@prompt.ok("  /        l                l")
    @@prompt.ok(" /          |                |")
    @@prompt.ok(" |   (0)    |                |")
    @@prompt.ok(" |  (000)   |  | | | | | | | |")
    @@prompt.ok(" |  (000)   |                |")
    @@prompt.ok(" l   (0)    |                |")
    @@prompt.ok("  l        //                /")
    @@prompt.ok("   l      //                /")
    @@prompt.ok("    l    /| | | | | | | | ||")
    @@prompt.ok("     `--'-|| | | | | | | | |")
    @@prompt.ok("           l                l")
    @@prompt.ok("            l                l")
    @@prompt.ok("             l                l")
    @@prompt.ok("              ll l l l l l l l l")
    @@prompt.ok("               l................l")
end


    # def self.graveyard 
    # person = self.all.last.name 
    # puts "        _  /)"
    # puts "        mo / )"
    # puts "        |/)\)"
    # puts "         /\_"
    # puts "         \__|="
    # puts "        (    )"
    # puts "        __)(__"
    # puts "  _____/      \\_____"
    # puts " |  _     ___   _   ||"
    # puts " | | \     |   | \  ||"
    # puts " | |  |    |   |  | ||"
    # puts " | |_/     |   |_/  ||"
    # puts " | | \     |   |    ||"
    # puts " | |  \    |   |    ||"
    # puts " | |   \. _|_. | .  ||"
    # puts " |                  ||"
    # puts " |  #{person}  ||"
    # puts " |                  ||"
    # puts "*       | *   **    * **   |**      **"
    # puts "\))ejm97/.,(//,,..,,\||(,,.,\\,.((//"  
    # end 


end
