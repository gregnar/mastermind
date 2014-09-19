class MasterMind

  def start
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp
    case input
    when "p" || "play" then 
    when "i" || "instructions" then Instructions.print_instructions
    when "q" or "quit" then exit
    end
  end



end
