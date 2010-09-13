require "helper"

class TestDuplicate < Test::Unit::TestCase
  test "maximum points with unique values" do
    max = Bridge::Points::Duplicate.new(-200, -100, 620, 630, 660, 690).max
    assert_equal 10, max[690]
    assert_equal  8, max[660]
    assert_equal  6, max[630]
    assert_equal  4, max[620]
    assert_equal  2, max[-100]
    assert_equal  0, max[-200]
  end

  test "maximum points with non-unique values" do
    max = Bridge::Points::Duplicate.new(420, 420, 400, 400, -50, -100).max
    assert_equal 9, max[420]
    assert_equal 5, max[400]
    assert_equal 2, max[-50]
    assert_equal 0, max[-100]
  end

  test "maximum points with non-unique values, without zero value" do
    max = Bridge::Points::Duplicate.new(430, 420, 420, 420, 300, 300).max
    assert_equal 10, max[430]
    assert_equal  6, max[420]
    assert_equal  1, max[300]
  end

  # test "maximum percents" do
  #   max_percents = Bridge::Points::Duplicate.new(50, 400, 110, 100, 110, 120, 50, 120, 140, 420, 110, 110, 110, 110, 50, 110, 140, 110).max_percents
  #   notify max_percents.inspect
  # end

  # test "maximum percents 2" do
  #   max_percents = Bridge::Points::Duplicate.new(-500, -650, -170, -170, -620, -620, -620).max_percents
  #   notify max_percents.inspect
  # end
end
