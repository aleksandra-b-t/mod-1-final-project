class Character < ActiveRecord::Base
    has_many :obstacles
    belongs_to :user
    belongs_to :item
    @@prompt = TTY::Prompt.new


#METHOD

# def turn
#     num = rand(1..2)
#     if num == 1
#         safe
#     elsif num == 2
# end

end
