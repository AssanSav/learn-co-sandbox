class  NYCCorp::CLI 

    def call 
            @input = nil 
        until @input == "exit" && @input == "back"
            puts "\nWelcome to NYC 50 Highly rated CORPORATIONS".colorize(:blue)
            puts "Type 'MENU' to display companies Names".colorize(:yellow)
            puts "Type 'ALL' to dysplay all Companies".colorize(:yellow)
            puts "Type 'EXIT' to exit!".colorize(:yellow)
            
            @input = gets.strip.downcase
        case @input 
            when "menu"
                listBy_name
            when "all"
                listAll_Corp
            when "back"
                checker
            when "exit"
            puts "GOODBYE & THANKS FOR YOUR BUSINESS!".colorize(:blue)
                 exit
        else 
            puts "WOOPS! INVALID INPUT!!!".colorize(:red)
            call
            end
        end
    end 


    def listBy_name
        NYCCorp::Company.all.first(25).each.with_index(1) do |corp, index|
            puts "#{index}. #{corp.name.colorize(:blue)}"
        end
        checker
    end


    def listAll_Corp
        NYCCorp::Company.all.each.with_index(1) do |corp, index|
            puts "#{index}. #{corp.name.colorize(:blue)}"
            puts "Domaine:#{corp.domaine.colorize(:red)}" 
            puts "Rating: #{corp.rating.colorize(:red)}" 
            puts "Summary: #{corp.summary}"
            puts "Link: https://www.indeed.com/#{corp.link.colorize(:red)}\n\n"
        end
    end


    def listBy_number
        puts "\nEnter 1 to 50 or BACK to MENU".colorize(:green) 
        @input = gets.strip
        choice = @input.to_i
    if (1..NYCCorp::Company.all.size).include?(choice) && choice <= NYCCorp::Company.all.size && @choice != "exit"
        selection = NYCCorp::Company.all[choice- 1]
        puts "Name: #{selection.name.colorize(:red)}"
        puts "Domaine: #{selection.domaine.colorize(:red)}"
        puts "Rating: #{selection.rating.colorize(:red)}"  
        puts "Summary: #{selection.summary.colorize(:red)}"
        puts "Link: https://www.indeed.com/#{selection.link.colorize(:red)}"
        checker
    else 
        puts "BACK TO THE MENU...!".colorize(:red)
        call
        end
    end

    def checker 
        listBy_number
        listBy_name
        listAll_Corp
    end

end