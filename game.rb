require_relative 'instructions'

class MasterMind

  def start
    puts "Welcome to MASTERMIND"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    case gets.chomp
    when ("p" || "play") then ask_difficulty
    when ("i" || "instructions") then Instructions.print_instructions
    when ("q" or "quit") then exit
    end
  end

  def ask_difficulty
  end

end
