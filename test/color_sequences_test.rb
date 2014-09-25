require_relative 'test_helper'
require '../lib/color_sequences'

class ColorsTest < MiniTest::Test

  def test_it_works
    string = "R"
    assert_equal Rainbow("R").red.bright, Colors.make_pretty(string)

    string = "Y"
    assert_equal Rainbow("Y").yellow.bright, Colors.make_pretty(string)

  end

end
