# Methods 
def player_input()
    color_options = ['red', 'blue', 'green', 'orange', 'pink', 'yellow', 'purple', 'brown']
    puts 'Write the code:'
    colors = gets.chomp.split
    print "\r" + ("\e[A\e[K"*2)
    until (color_options.include?(colors[0]) && color_options.include?(colors[1]) && color_options.include?(colors[2]) && color_options.include?(colors[3])) && colors.length < 5
        puts "\n\nYou must pick 4 colors from the list! \n\n"
        colors = gets.chomp.split
        print "\r" + ("\e[A\e[K"*5)
    end
    return colors
end

def feedback(list1, list2)
    list3 = []
    if list1[0] == list2[0]
        list3.push('black')
    else
        list3.push('white') if list1.include?(list2[0])
    end
    if list1[1] == list2[1]
        list3.push('black')
    else
        list3.push('white') if list1.include?(list2[1])
    end
    if list1[2] == list2[2]
        list3.push('black')
    else
        list3.push('white') if list1.include?(list2[2])
    end
    if list1[3] == list2[3]
        list3.push('black')
    else
        list3.push('white') if list1.include?(list2[3])
    end
    return list3
end

def remove_colors(list, wrong_colors)
    for color in wrong_colors
        list.delete(color)
    end
end

def remove_colors2(list_of_lists, list_of_colors)
    x = 0
    for list in list_of_lists
        list.delete(list_of_colors[x])
        x += 1
    end
end

def computer_feedback(list1, list2)
    list3 = []
    list3.push('white(1)') if list1.include?(list2[0])
    list3.push('white(2)') if list1.include?(list2[1])
    list3.push('white(3)') if list1.include?(list2[2])
    list3.push('white(4)') if list1.include?(list2[3])
    return list3
end

# Classes

class PlayerVsComputer
    def play
        color_options = ['red', 'blue', 'green', 'orange', 'pink', 'yellow', 'purple', 'brown']
        puts "\n\nAvailable colors: #{color_options}"
        puts "=============================================================================================\n\n"
        computer_list = color_options.sample(4)
        player_list = player_input()
        round = 1
        while player_list != computer_list
            puts "Round #{round} \n\n"
            puts "Guess: #{player_list} \n\n"
            puts "Feedback: #{feedback(computer_list, player_list)}"
            puts '-------------------------------------------------------------'
            if round == 12 && feedback(computer_list, player_list) != ['black', 'black', 'black', 'black']
                print "\r" + ("\e[A\e[K"*1)
                puts "=============================================================================================\n\n"
                puts "You lost\n\n"
                puts  "Computer code: #{computer_list}"
                break
            end
            player_list = player_input()
            round += 1
        end
        if player_list == computer_list
            puts "Round #{round} \n\n"
            puts "Guess: #{player_list} \n\n"
            puts "Feedback: #{feedback(computer_list, player_list)}"
            puts "=============================================================================================\n\n"
            puts 'You won'
        end
    end
end

class ComputerVsPlayer
    
    def play
        color_options = ['red', 'blue', 'green', 'orange', 'pink', 'yellow', 'purple', 'brown']
        puts "\n\nAvailable colors: #{color_options}"
        puts "=============================================================================================\n\n"
        player_list = player_input()
        computer_list = color_options.sample(4)
        round = 1
        while computer_feedback(player_list, computer_list) != ['white(1)', 'white(2)', 'white(3)', 'white(4)']
            if computer_list.length < 4
                computer_list = [computer_list, color_options.sample(4 - computer_list.length)].flatten
                break
            end
            puts "Round #{round} \n\n"
            puts "Guess: #{computer_list} \n\n"
            puts "Feedback: #{feedback(player_list, computer_list)}"
            puts '-------------------------------------------------------------'
            if computer_feedback(player_list, computer_list) == ['white(1)']
                remove_colors(color_options, [computer_list[1], computer_list[2], computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(1)', 'white(2)']
                remove_colors(color_options, [computer_list[2], computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(1)', 'white(2)', 'white(3)']
                remove_colors(color_options, [computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(2)', 'white(3)', 'white(4)']
                remove_colors(color_options, [computer_list[0]])
            elsif computer_feedback(player_list, computer_list) == ['white(3)', 'white(4)']
                remove_colors(color_options, [computer_list[0], computer_list[1]])
            elsif computer_feedback(player_list, computer_list) == ['white(4)']
                remove_colors(color_options, [computer_list[0], computer_list[1], computer_list[2]])
            elsif computer_feedback(player_list, computer_list) == ['white(2)']
                remove_colors(color_options, [computer_list[0], computer_list[2], computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(2)', 'white(3)']
                remove_colors(color_options, [computer_list[0], computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(3)']
                remove_colors(color_options, [computer_list[0], computer_list[1], computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(1)', 'white(2)', 'white(4)']
                remove_colors(color_options, [computer_list[2]])
            elsif computer_feedback(player_list, computer_list) == []
                remove_colors(color_options, [computer_list[0], computer_list[1], computer_list[2], computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(1)', 'white(4)']
                remove_colors(color_options, [computer_list[1], computer_list[2]])
            elsif computer_feedback(player_list, computer_list) == ['white(1)', 'white(3)', 'white(4)']
                remove_colors(color_options, [computer_list[1]])
            elsif computer_feedback(player_list, computer_list) == ['white(1)', 'white(3)']
                remove_colors(color_options, [computer_list[1], computer_list[3]])
            elsif computer_feedback(player_list, computer_list) == ['white(2)', 'white(4)']
                remove_colors(color_options, [computer_list[0], computer_list[2]])
            end
            computer_list = color_options.sample(4)
            round +=1
        end

        first_color_list = [color_options].flatten
        second_color_list = [color_options].flatten
        third_color_list = [color_options].flatten
        fourth_color_list = [color_options].flatten
        
        if feedback(player_list, computer_list) == ['black', 'black', 'black', 'black']
            puts "Round #{round} \n\n"
            puts "Guess: #{computer_list} \n\n"
            puts "Feedback: #{feedback(player_list, computer_list)}"
            puts '-------------------------------------------------------------'
            puts "\n\nThe computer won \n\n"
            puts "Your code: #{player_list}\n\n"
        end

        while computer_list != player_list
            if round > 12
                puts 'You won'
                break
            end
            if computer_list[0] == player_list[0] && computer_list[1] == player_list[1] && computer_list[2] == player_list[2] && computer_list[3] != player_list[3]
                remove_colors2([fourth_color_list], [computer_list[3]])
                computer_list = [player_list[0], player_list[1], player_list[2], fourth_color_list[0]]
            elsif computer_list[0] == player_list[0] && computer_list[1] == player_list[1] && computer_list[2] != player_list[2] && computer_list[3] != player_list[3]
                remove_colors2([third_color_list, fourth_color_list], [computer_list[2], computer_list[3]])
                computer_list = [player_list[0], player_list[1], third_color_list[0], fourth_color_list[0]]
            elsif computer_list[0] == player_list[0] && computer_list[1] != player_list[1] && computer_list[2] != player_list[2] && computer_list[3] != player_list[3]
                remove_colors2([second_color_list, third_color_list, fourth_color_list], [computer_list[1], computer_list[2], computer_list[3]])
                computer_list = [player_list[0],  second_color_list[0], third_color_list[0], fourth_color_list[0]]
            elsif computer_list[3] == player_list[3] && computer_list[0] != player_list[0] && computer_list[1] != player_list[1] && computer_list[2] != player_list[2]
                remove_colors2([first_color_list, second_color_list, third_color_list], [computer_list[0], computer_list[1], computer_list[2]])
                computer_list = [first_color_list[0], second_color_list[0], third_color_list[0], player_list[3]]
            elsif computer_list[3] == player_list[3] && computer_list[2] == player_list[2] && computer_list[0] != player_list[0] && computer_list[1] != player_list[1]
                remove_colors2([first_color_list, second_color_list], [computer_list[0], computer_list[1]])
                computer_list = [first_color_list[0], second_color_list[0], player_list[2], player_list[3]]
            elsif computer_list[3] == player_list[3] && computer_list[2] == player_list[2] && computer_list[1] == player_list[1] && computer_list[0] != player_list[0]
                remove_colors2([first_color_list], [computer_list[0]])
                computer_list = [first_color_list[0], player_list[1], player_list[2], player_list[3]]
            elsif computer_list[1] == player_list[1] && computer_list[0] != player_list[0] && computer_list[2] != player_list[2] && computer_list[3] != player_list[3]
                remove_colors2([first_color_list, third_color_list, fourth_color_list], [computer_list[0], computer_list[2], computer_list[3]])
                computer_list = [first_color_list[0], player_list[1], third_color_list[0], fourth_color_list[0]]
            elsif computer_list[1] == player_list[1] && computer_list[2] == player_list[2] && computer_list[0] != player_list[0] && computer_list[3] != player_list[3]
                remove_colors2([first_color_list, fourth_color_list], [computer_list[0], computer_list[3]])
                computer_list = [first_color_list[0], player_list[1], player_list[2], fourth_color_list[0]]
            elsif computer_list[0] == player_list[0] && computer_list[3] == player_list[3] && computer_list[1] != player_list[1] && computer_list[2] != player_list[2]
                remove_colors2([second_color_list, third_color_list], [computer_list[1], computer_list[2]])
                computer_list = [player_list[0], second_color_list[0], third_color_list[0], player_list[3]]
            elsif computer_list[0] == player_list[0] && computer_list[3] == player_list[3] && computer_list[1] == player_list[1] && computer_list[2] != player_list[2]
                remove_colors2([third_color_list], [computer_list[2]])
                computer_list = [player_list[0], player_list[1], third_color_list[0], player_list[3]]
            elsif computer_list[0] == player_list[0] && computer_list[2] == player_list[2] && computer_list[1] != player_list[1] && computer_list[3] != player_list[3]
                remove_colors2([second_color_list, fourth_color_list], [computer_list[1], computer_list[3]])
                computer_list = [player_list[0], second_color_list[0], player_list[2], fourth_color_list[0]]
            elsif computer_list[0] == player_list[0] && computer_list[3] == player_list[3] && computer_list[2] == player_list[2] && computer_list[1] != player_list[1]
                remove_colors2([second_color_list], [computer_list[1]])
                computer_list = [player_list[0], second_color_list[0], player_list[2], player_list[3]]
            elsif computer_list[2] == player_list[2] && computer_list[0] != player_list[0] && computer_list[1] != player_list[1] && computer_list[3] != player_list[3]
                remove_colors2([first_color_list, second_color_list, fourth_color_list], [computer_list[0], computer_list[1], computer_list[3]])
                computer_list = [first_color_list[0], second_color_list[0], player_list[2], fourth_color_list[0]]
            elsif computer_list[1] == player_list[1] && computer_list[3] == player_list[3] && computer_list[0] != player_list[0] && computer_list[2] != player_list[2]
                remove_colors2([first_color_list, third_color_list], [computer_list[0], computer_list[2]])
                computer_list = [first_color_list[0], player_list[1], third_color_list[0], player_list[3]]
            else
                computer_list = color_options.sample(4)
            end
            puts "Round #{round} \n\n"
            puts "Guess: #{computer_list} \n\n"
            puts "Feedback: #{feedback(player_list, computer_list)}"
            puts '-------------------------------------------------------------'
            if feedback(player_list, computer_list) == ['black', 'black', 'black', 'black']
                print "\r" + ("\e[A\e[K"*1)
                puts "=============================================================================================\n\n"
                puts "The computer won \n\n"
                puts "Your code: #{player_list}\n\n"
            end
            round +=1
        end
    end
end

puts "Hello\n\n"
puts 'Write 1 if you want to play as the CODEMAKER, write 2 if you want to play as the CODEBRAKER:'
choice = gets.chomp
while choice != '1' && choice != '2'
    puts 'You have to write 1 or 2'
    choice = gets.chomp
end
if choice == '1'
    puts " \n\nYou are playing as the codemaker \n\n"
    board2 = ComputerVsPlayer.new
    board2.play
elsif choice == '2'
    puts "\n\nYou are playing as the codebraker \n\n"
    board1 = PlayerVsComputer.new
    board1.play
end
