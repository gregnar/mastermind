require_relative 'test_helper'
require '../lib/game'

class GameTest < Minitest::Test

  def test_set_up_difficulty
    game = Game.new("beginner")
    game.set_up_difficulty_message(game.difficulty)
    assert game.colors.include?("(r)ed")
    assert "four", game.elements

    game2 = Game.new("intermediate")
    game2.set_up_difficulty_message(game2.difficulty)
    assert game2.colors.include?("(w)hite")
    assert "four", game2.elements

    game3 = Game.new("advanced")
    game3.set_up_difficulty_message(game3.difficulty)
    assert game3.colors.include?("(p)urple")
    assert "eight", game3.elements
  end

  def test_exit
      tester = StringIO.new("q")
      game = Game.new("beginner", tester, $stdout)
      refute game.exit?
      game.get_guess
      assert game.exit?
  end
end
