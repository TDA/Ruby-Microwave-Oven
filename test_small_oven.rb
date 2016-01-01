require './small_oven'
require 'minitest/autorun'

# load the minitest suite, then write tests
class TestSmallOven < MiniTest::Test
  def test_turn_on
    oven = SmallOven.new
    # assert for positive and refute for negative assertions, yay!
    refute_equal(oven.state, "on", "Oven state is on by default!!")
    oven.turn_on
    # first arg => actual value
    # second arg => expected value
    # third => message to display if not matching
    assert_equal(oven.state, "on", "Oven state is not ON even after switching on!")
  end

  def test_turn_off
    oven = SmallOven.new
    # first arg => actual value
    # second arg => expected value
    # third => message to display if not matching
    assert_equal(oven.state, "off", "Oven state is not off by default!!")
    oven.turn_on
    refute_equal(oven.state, "off", "Oven state is off even after switching on!")
    # other asserts include assert_includes, assert_raises, assert_instance_of
  end

  def test_bake
    oven = SmallOven.new
    assert_raises(OvenOffError, "No exception raised") do
      oven.bake
    end
    assert_raises(OvenEmptyError, "No exception raised") do
      oven.turn_on
      oven.bake
    end
    oven.turn_on
    oven.contents = "apple"
    assert_equal(oven.contents, "apple", "Oven contains wrong item")
  end
end