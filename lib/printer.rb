require 'rainbow'
require_relative 'color_sequences'

class Printer
  attr_reader :stream, :elements, :colors, :message

  def initialize(stdout=$stdout)
    @stream = stdout
  end

  def welcome_message
    stream.puts Rainbow("WELCOME TO MASTERMIND").green.bright
    stream.puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    instructions = Rainbow("\nINSTRUCTIONS:\n").cyan.bright +
                 "Guess the hidden sequence of colors by entering the first letter of each color.\n" +
                 "Entering 'bryg' will test for sequence Blue-Red-Yellow-Green.\n" +
                 "When you guess the sequence, you win!"

    stream.puts instructions
    stream.puts Rainbow("Enter another command.\n").green.bright
  end

  def ask_difficulty
    stream.puts Rainbow("Select difficulty level: (b)eginner, (i)ntermediate or (a)dvanced.").cyan.bright
  end


  def initiate_message(diff, elems, cols)
    @message =  "\nI have generated a secret #{diff} sequence with #{elems} elements made up of:\n" +
          "#{cols.join(" - ")}.\n" +
          "Use (q)uit at any time to end the game.\n"
    stream.puts Rainbow(message).blue.bright
  end

  def start_guessing
    stream.puts Rainbow("++Start guessing++").green.bright
  end

  def invalid_input
    stream.puts Rainbow("Invalid input. Try again.").red.bright
  end

  def guess_feedback(guess, correct_elements, correct_positions)
    guess = Colors.make_pretty(guess)
    correct_elements = Rainbow(correct_elements.to_s).white.bright
    correct_positions = Rainbow(correct_positions.to_s).red.bright
    stream.puts "#{guess} has #{correct_elements} correct elements, with " +
        "#{correct_positions} in the correct position."
  end

  def you_win
    stream.puts Rainbow("You win!!!!!").blue.bright
  end

  def time_taken(start, finish)
    net_seconds = finish - start
    minutes = (net_seconds / 60).to_i
    seconds = (net_seconds % 60).to_i
    stream.puts "Time elapsed: #{minutes} minutes and #{seconds} seconds."
  end

  def turns_taken(turns)
    stream.puts "Number of turns: #{turns.to_s}"
  end

  def play_again
      stream.puts Rainbow("Would you like to (p)lay again, or (q)uit?").green.bright
  end

  def quit
    stream.puts Rainbow("Goodbye!").red.bright
  end

end
