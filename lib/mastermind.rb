require_relative 'printer'
require_relative 'game'

class MasterMind

  attr_reader :printer, :command

  def initialize
    @printer = Printer.new
  end

  def start
    printer.welcome_message
    until exit? || play?
      @command = gets.strip
      case
      when play?
        set_difficulty
        break
      when instructions?
        printer.instructions
      when exit?
        printer.quit
        exit
      else
        printer.invalid_input
      end
    end
  end


  def set_difficulty
    printer.ask_difficulty
    until exit?
      @command = gets.strip
      case
      when beginner?
        Game.new("beginner").play
        break
      when intermediate?
        Game.new("intermediate").play
        break
      when advanced?
        Game.new("advanced").play
        break
      when exit?
        printer.quit
      else
        printer.invalid_input
      end
    end
  end

  def play_again
    printer.play_again
    until exit?
      @command = gets.strip
      case
      when exit?
        printer.quit
      when play?
        start
        break
      else
        printer.invalid_input
      end
    end
  end

  def beginner?
    command == "b" || command == "beginner"
  end

  def intermediate?
    command == "i" || command == "intermediate"
  end

  def advanced?
    command == "a" || command == "advanced"
  end

  def instructions?
    command == "i" || command == "instructions"
  end

  def play?
    command == "p" || command == "play"
  end

  def exit?
    command == "q" || command == "quit"
  end

end
