require_relative 'test_helper'
require '../lib/CLI'
require '../lib/printer'

class CLITest < Minitest::Test


  def test_cli_recognizes_beginner
    tester = StringIO.new("b")
    game = CLI.new(tester, StringIO.new)
    refute game.beginner?
    game.gets_command
    assert_equal "b", game.command
    assert game.beginner?
  end

  def test_cli_recognizes_intermediate
    tester = StringIO.new("i")
    game = CLI.new(tester, StringIO.new)
    game.gets_command
    assert_equal "i", game.command
    assert game.intermediate?
  end

  def test_cli_recognizes_advanced
    tester = StringIO.new("a")
    game = CLI.new(tester, StringIO.new)
    refute game.advanced?
    game.gets_command
    assert_equal "a", game.command
    assert game.advanced?
  end

  def test_game_recognizes_instructions_input
    tester = StringIO.new("i")
    game = CLI.new(tester, StringIO.new)
    refute game.instructions?
    game.gets_command
    assert_equal "i", game.command
    assert game.instructions?
  end

  def test_exit_method
      tester = StringIO.new("q")
      game = CLI.new(tester, StringIO.new)
      refute game.exit?
      game.gets_command
      assert_equal "q", game.command
      assert game.exit?
  end

end
