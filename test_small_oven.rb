require './small_oven'
require 'minitest/autorun'

# load the minitest suite, then write tests
class TestSmallOven < MiniTest::Test
  def test_turn_on
    oven = SmallOven.new
    assert(oven.state != "on")
    oven.turn_on
    assert(oven.state == "on")
  end
end