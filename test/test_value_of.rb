
require "test/unit"

class TestValueOf < Test::Unit::TestCase
  
  def test_value_of_by_string
    assert_equal Color::RED, Color.value_of('RED')
  end
  
  def test_value_of_by_symbol
    assert_equal Color::GREEN, Color.value_of(:GREEN)
  end
  
  def test_value_of_by_ordinal
    assert_equal Color::BLUE, Color.value_of(2)
  end
  
  def test_value_of_by_case_insensitive_string
    assert_equal Color::RED, Color.value_of('red')
  end
  
  def test_value_of_by_case_insensitive_symbol
    assert_equal Color::GREEN, Color.value_of(:green)
  end
  
  def test_value_of_raises_with_invalid_value_type
    assert_raise ArgumentError do
      Color.value_of(1.35)
    end
  end
  
  def test_value_of_raises_with_unavailable_mapping
    assert_raise NameError do
      Color.value_of(:NO_SUCH_VALUE)
    end
  end

  class Color < Enum
    enum %w(
      RED
      GREEN
      BLUE
    )
  end

end
