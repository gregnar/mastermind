require_relative 'printer'
require_relative 'game'

class CLI

  attr_reader :printer, :command, :stdin
  attr_writer :command

  def initialize(stdin=$stdin, stdout=$stdout)
    @printer = Printer.new(stdout)
    @stdin = stdin
  end

  def start
    printer.welcome_message
    @command = ""
    until exit? || play?
      gets_command
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
    @command = "" #resets @command in case of replay
    until exit?
      gets_command
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
    loop do
      gets_command
      case
      when exit?
        printer.quit
        exit
      when play?
        start
        break
      else
        printer.invalid_input
      end
    end
  end

  def gets_command
    @command = stdin.gets.strip
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
