# main menue
# have a case statement for main menu options
# command line menu
# ide menu
# search menu


def  main
  puts "------------- Cheetsheet for Terminal Commands -------------"
  puts """
  Main Menu:
  1. Command Line 
  2. IDE 
  3. Search 
  4. Quit
  """ 
end
# def go_back
#     puts "Go back to main menue?"
#     back = gets.strip
#     if back == "yes" 
#       main
#     end
# end
choice = 1

while choice != "4"
    main
    puts "What's your choice (1, 2, 3 or 4)? >"
      choice = gets.strip

    case choice 
      when "1"
        command_selection = 1
        while command_selection != "4"
          puts """
          Make a selection:
          1. Copy - cp - cp path/to/file path/to/destination
          2. Move - mv - mv path/to/file path/to/destination
          3. Make Directory - mkdir - mkdir path/name/of/directory/
          4. Main Menu.
          """
          command_selection = gets.strip

          if command_selection == "1"
            puts `man cp`
            
          elsif command_selection == "2"
            puts `man mv`
            
          elsif command_selection == "3"
            puts `man mkdir`
          else
            puts "not valid"  
          end
        end
      when "2"
        puts """
        ----- Shorcuts in Sublime -----
        ⌘ + X Cut line
        ⌘ + ↩ Insert line after
        ⌘ + ⇧ + ↩ Insert line before
        ⌘ + ⌃ + ↑ Move line/selection up
        ⌘ + ⌃ + ↓ Move line/selection down
        ⌘ + L Select line - Repeat to select next lines
        ⌘ + D Select word - Repeat to select next occurrence
        ⌃ + ⌘ + G Select all occurrences of current selection
        ⌃ + ⇧ + ↑ Extra cursor on the line above
        ⌃ + ⇧ + ↓ Extra cursor on the line below
        ⌃ + M Jump to closing parentheses Repeat to jump to opening parentheses
        ⌃ + ⇧ + M Select all contents of the current parentheses
        ⌃ + A Move to beginning of line
        """

      when "3"

        puts "What terminal command would you like to search?"
        search = gets.strip
        puts `man #{search}`
        

      when "4"
        puts "Quiting..."
      else 
        puts "not valid"
    end  
end