require_relative 'test_helper'
require '../lib/printer'
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
end
