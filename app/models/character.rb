class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :item
    @@prompt = TTY::Prompt.new

def encounter_hobo
    puts "AS YOU CONTINUE DOWN THE BLOCK, YOU SEE A HOMELESS MAN COMING YOUR WAY."
    choices = ["USE PANIC CRY!", "SPRAY HIM WITH LYSOL AND RUN!"]
    response = @@prompt.multi_select('HOW DO YOU WISH TO REACT?', choices, min: 1, max: 1)

    if response[0] == "USE PANIC CRY!"
        if self.panic_cry == "[\"HELP!\"]"
            self.hp -= 2
            puts "THE HOBO RELEASES YOU AND YOU RUN AWAY. LOSE 2 HEALTH POINTS."
        elsif self.panic_cry == "[\"GET A JOB!\"]"
            self.hp -= 4
            puts "THE HOBO GETS ANGRY AND SPITS ON YOU. LOSE 4 HEALTH POINTS."
        elsif self.panic_cry == "[\"(COUGH, COUGH)\"]"
            self.hp -= 1
            puts "THE HOBO BECOMES AFRAID THAT YOU MIGHT HAVE COVID-19 AND WALKS PAST YOU. LOSE 1 HEALTH POINT."
        end
    else
        puts "THE HOBO GASPS AND YOU MAKE A CLEAN GETAWAY. NO HEALTH POINTS DEDUCTED."
    end
    puts "YOUR HEALTH IS NOW AT: #{self.hp}" 
    self.death_status
end    

def death_status
    if self.hp < 1
        puts "YOU'VE CONTRACTED THE VIRUS."
        puts "GAME OVER!"
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
