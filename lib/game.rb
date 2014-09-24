require_relative 'sequence_generator'
require_relative 'checker'
require_relative 'printer'
require 'pry'

class Game

  attr_reader :difficulty, :printer, :checker

  def initialize(difficulty)
    @difficulty = difficulty
    @printer = Printer.new
  end

  def play
    generator = SequenceGenerator.new(difficulty)
    generator.generate_sequence
    @solution = generator.solution_sequence
    printer.initiate_game(difficulty)
    play_loop
  end

  def play_loop
    @checker = GuessChecker.new(@solution)
    printer.start_guessing
    @start_time = Time.now
    until exit? || win?
      @guess = gets.strip.upcase
      case
      when win?
        printer.you_win
        end_time = Time.now
        printer.time_taken(@start_time, end_time)
      when exit?
        printer.quit
        exit
      when wrong_length?
        printer.invalid_input
      when right_length?
        checker.check_guess(@guess)
        printer.guess_feedback(@guess, checker.correct_elements, checker.correct_position)
        checker.reset
      end
    end
  end


  def beginner?
    difficulty == "beginner"
  end

  def intermediate?
    difficulty == "intermediate"
  end

  def advanced?
    difficulty == "advanced"
  end

  def wrong_length?
    @guess.length != @solution.length
  end

  def right_length?
    @guess.length == @solution.length
  end

  def win?
    @guess == @solution
  end

  def exit?
    @guess == "Q" || @guess == "QUIT"
  end
end
