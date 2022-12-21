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
            player_list = []
            player_input(player_list)
            if player_list == computer_list
                puts 'You broke the code, congrats!' 
                break
            else
            puts 'It is not correct, try something else'
            end
        end
    end

end

def player_input(list)
    4.times do
        puts 'Write a color'
        color = gets.chomp
        list.push(color)
    end
end

board1 = Board.new('red', 'white', 'blue', 'green')
board1.play