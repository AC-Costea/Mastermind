class Board
    def initialize(color1, color2, color3, color4)
        @color1 = color1
        @color2 = color2
        @color3 = color3
        @color4 = color4
    end
     
    def play
        computer_list = [@color1, @color2, @color3, @color4]
        10.times do
            player_list = player_input()
            p player_list
            if player_list == computer_list
                puts 'You broke the code, congrats!' 
                break
            else
            puts 'It is not correct, try something else'
            feedback_list = feedback(computer_list, player_list)
            p  feedback_list
            end
        end
    end

end

def player_input()
    puts 'Write the colors'
    colors = gets.chomp.split
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
        

board1 = Board.new('red', 'white', 'blue', 'green')
board1.play