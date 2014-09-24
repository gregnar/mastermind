require_relative 'printer'
require_relative 'game'

class MasterMind

  def initialize
    @printer = Printer.new
  end

  def start
    @printer.welcome_message
    until exit? || play?
      @command = gets.strip
      case
      when play?
        set_difficulty
        break
      when instructions?
        @printer.instructions
      when exit?
        @printer.quit
      else
        @printer.invalid_input
      end
    end
  end


  def set_difficulty
    @printer.ask_difficulty
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
        @printer.quit
      else
        @printer.invalid_input
      end
    end
  end

  def play_again
    @printer.play_again
    @command_again = gets.strip
    until exit?
      case
      when play_again?
        start
        break
      else
        @printer.invalid_input
      end
    end
  end

  def beginner?
    @command == "b" || @command == "beginner"
  end

  def intermediate?
    @command == "i" || @command == "intermediate"
  end

  def advanced?
    @command == "a" || @command == "advanced"
  end

  def you_win
  end

  def instructions?
    @command == "i" || @command == "instructions"
  end

  def play?
    @command == "p" || @command == "play"
  end

  def play_again?
    @command_again == "p" || @command_again == "play again"
  end

  def exit?
    @command == "q" || @command == "quit"
  end
end
