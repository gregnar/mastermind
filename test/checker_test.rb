require_relative 'test_helper'
require '../lib/checker'

class GuessCheckerTest < Minitest::Test

  def test_check_guess_beginner
    checker = GuessChecker.new("rrby")
    checker.check_guess("byrr")

    assert checker.correct_elements == 4
    assert checker.correct_position == 0
  end

  def test_check_guess_intermediate
    checker = GuessChecker.new("rrbyww")
    checker.check_guess("byrrww")

    assert checker.correct_elements == 6
    assert checker.correct_position == 2
  end

  def test_check_guess_advanced
    checker = GuessChecker.new("rrbywp")
    checker.check_guess("yyrrww")

    assert checker.correct_elements == 4
    assert checker.correct_position == 1
  end

end
