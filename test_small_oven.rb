require './small_oven'
require 'minitest/autorun'

# load the minitest suite, then write tests
class TestSmallOven < MiniTest::Test
  def test_turn_on
    oven = SmallOven.new
    assert(oven.state != "on", "Oven state is on by default!!")
    oven.turn_on
    assert(oven.state == "on", "Oven state is not ON even after switching on!")
  end

  def test_turn_off
    oven = SmallOven.new
    assert_equal(oven.state, "off", "Oven state is not off by default!!")
    oven.turn_on
    assert(oven.state != "off", "Oven state is off even after switching on!")
  end
end