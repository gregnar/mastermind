require 'rainbow'
require_relative 'color_sequences'

class Printer

  attr_reader :elements, :colors, :message

  def welcome_message
    puts Rainbow("WELCOME TO MASTERMIND").green.bright
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "THESE ARE THE INSTRUCTIONS."
    puts "Enter another command."
  end

  def ask_difficulty
    puts Rainbow("Select difficulty level: (b)eginner, (i)ntermediate or (a)dvanced.").cyan.bright
  end

  def initiate_game(difficulty)
    @colors = ["(r)ed", "(g)reen", "(b)lue", "(y)ellow"]
    @elements = ""
    case difficulty
    when "beginner"
      elements = "four"
    when "intermediate"
      elements = "six"
      colors << "(w)hite"
    when "advanced"
      elements = "eight"
      colors << "(w)hite"
      colors << "(p)urple"
    end
    initiate_message(difficulty, elements, colors)
  end

  def initiate_message(diff, elems, cols)
    @message =  "I have generated a secret #{diff} sequence with #{elems} elements made up of:\n" +
          "#{cols.join(" - ")}.\n" +
          "Use (q)uit at any time to end the game."
    puts message
  end

  def start_guessing
    puts Rainbow("Start guessing").green.bright
  end

  def invalid_input
    puts Rainbow("Invalid input. Try again.").red.bright
  end

  def guess_feedback(guess, correct_elements, correct_positions)
    guess = Colors.make_pretty(guess)
    correct_elements = Rainbow(correct_elements.to_s).white.bright
    correct_positions = Rainbow(correct_positions.to_s).red.bright
    puts "#{guess} has #{correct_elements} correct elements, with " +
        "#{correct_positions} in the correct position."
  end

  def you_win
    puts Rainbow("You win!!!!!").blue.bright
  end

  def time_taken(start, finish)
    net_seconds = finish - start
    minutes = (net_seconds / 60).to_i
    seconds = (net_seconds % 60).to_i
    puts "Time elapsed: #{minutes} minutes and #{seconds} seconds."
  end

  def play_again
      puts "Would you like to (p)lay again, or (q)uit?"
  end

  def quit
    puts Rainbow("Goodbye!").red.bright
  end

end
