require "test/unit"

class TestLookupBy < Test::Unit::TestCase

  def test_lookup_by_first_field_matches_all_values
    assert_equal Color::RED  , Color.lookup_by(:abbreviation, 'r')
    assert_equal Color::GREEN, Color.lookup_by(:abbreviation, 'g')
    assert_equal Color::BLUE , Color.lookup_by(:abbreviation, 'b')
  end

  def test_lookup_by_second_field_matches_all_values
    assert_equal Color::RED, Color.lookup_by(:spanish_name, 'rojo')
    assert_equal Color::GREEN, Color.lookup_by(:spanish_name, 'verde')
    assert_equal Color::BLUE, Color.lookup_by(:spanish_name, 'azul')
  end

  def test_lookup_by_of_non_existent_value_returns_nil
    assert_equal nil, Color.lookup_by(:abbreviation, 'rojo')
    assert_equal nil, Color.lookup_by(:spanish_name, 'g')
  end

  def test_lookup_by_of_invalid_field_name_raises_name_error
    begin
      res = Color.lookup_by(:invalid_field, 'r')
      fail("Got result '#{res}' in lookup on invalid field name!")
    rescue NameError => e
      assert e.message !~ /undefined method lookup_by/ # Make sure the lookup_by method call didn't cause this
    end
  end

  class Color < Enum
    enum_fields :abbreviation, :spanish_name
    enum do
      RED('r', 'rojo')
      GREEN('g', 'verde')
      BLUE('b', 'azul')
    end
  end
end
