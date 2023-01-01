# Methods for the PlayerVsComputer class
def player_input()
    color_options = ['red', 'blue', 'green', 'orange', 'pink', 'yellow', 'purple', 'brown']
    puts "Available colors: #{color_options} \n\n"
    colors = gets.chomp.split
    until (color_options.include?(colors[0]) && color_options.include?(colors[1]) && color_options.include?(colors[2]) && color_options.include?(colors[3])) && colors.length < 5
        puts "You must pick 4 colors from the list! \n\n"
        colors = gets.chomp.split
    end
    return colors
end

def feedback(list1, list2)
    list3 = []
    if list1[0] == list2[0]
        list3.push('black(1)')
    else
        if list1.include?(list2[0])
            list3.push('white(1)')
        end
    end
    if list1[1] == list2[1]
        list3.push('black(2)')
    else
        if list1.include?(list2[1])
            list3.push('white(2)')
        end
    end
    if list1[2] == list2[2]
        list3.push('black(3)')
    else
        if list1.include?(list2[2])
            list3.push('white(3)')
        end
    end
    if list1[3] == list2[3]
        list3.push('black(4)')
    else
        if list1.include?(list2[3])
            list3.push('white(4)')
        end
    end
    return list3
end

class PlayerVsComputer
    def play
        color_options = ['red', 'blue', 'green', 'orange', 'pink', 'yellow', 'purple', 'brown']
        computer_list = color_options.sample(4)
        10.times do
            player_list = player_input()
            puts "#{player_list} \n\n"
            if player_list == computer_list
                puts 'You broke the code, congrats!' 
                break
            else
            feedback_list = feedback(computer_list, player_list)
            puts  "Feedback: #{feedback_list} \n\n"
            end
        end
    end
end

board1 = PlayerVsComputer.new
board1.play
