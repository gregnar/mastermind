require_relative 'test_helper'
require '../lib/printer'
require '../lib/color_sequences'
require 'stringio'

class PrinterTest < Minitest::Test

  def test_welcome_message
    tester = StringIO.new
    printer = Printer.new(tester)
    printer.welcome_message
    assert tester.string.include?("WELCOME")
  end

  def test_instructions
    tester = StringIO.new
    printer = Printer.new(tester)
    printer.instructions
    #tester.string
    assert tester.string.include?("hidden sequence")
  end

  def test_ask_difficulty
    tester = StringIO.new
    printer = Printer.new(tester)
    printer.ask_difficulty
    assert tester.string.include?("difficulty level")
  end

  def test_initiate_message_can_take_different_arguments
    tester = StringIO.new
    printer = Printer.new(tester)
    printer.initiate_message("beginner", "four", ["red", "blue"])
    assert tester.string.include?("beginner")
    assert tester.string.include?("four")
    assert tester.string.include?("red")

    printer.initiate_message("intermediate", "six", ["yellow", "purple"])
    assert tester.string.include?("intermediate")
    assert tester.string.include?("six")
    assert tester.string.include?("yellow")
  end

  def test_guess_feedback_can_take_multiple_arguments
    tester = StringIO.new
    printer = Printer.new(tester)
    printer.guess_feedback("RY", 3, 2)
    assert tester.string.include?("Y")
    assert tester.string.include?("3")
    assert tester.string.include?("2")

    printer.guess_feedback("B", 6, 10)
    assert tester.string.include?("B")
    assert tester.string.include?("6")
    assert tester.string.include?("10")
  end

  def test_turns_taken
    tester = StringIO.new
    printer = Printer.new(tester)
    printer.turns_taken(6)
    assert_equal "Number of turns: 6", tester.string.chomp
    tester.string = ""
    printer.turns_taken(100)
    assert_equal "Number of turns: 100", tester.string.chomp
  end


end
