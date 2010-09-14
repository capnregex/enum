
require "test/unit"
require "operation"

class TestOperation < Test::Unit::TestCase

  def test_sanity
    assert Operation
  end

  def test_values
    assert_equal [Operation::PLUS, Operation::MINUS, Operation::TIMES,
      Operation::DIVIDE], Operation.values
  end

  def test_operations
    assert_equal 3, Operation::PLUS.evaluate(1,2)
    assert_equal 6, Operation::MINUS.evaluate(8,2)
    assert_equal 6, Operation::TIMES.evaluate(3,2)
    assert_equal 6, Operation::DIVIDE.evaluate(12,2)
  end

end

