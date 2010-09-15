
require "test/unit"
require "day"

class TestDay < Test::Unit::TestCase

  def test_day_defined
    assert Day
  end

  def tell_it_like_it_is day
    case day
    when Day::MONDAY then "Mondays are bad."
    when Day::FRIDAY then "Fridays are better."
    when Day::SATURDAY,Day::SUNDAY then "Weekends are best."
    when Day then "Midweek days are soso."
    else "Not a Day"
    end
  end

  def test_day_case
    assert_equal "Mondays are bad.", tell_it_like_it_is(Day::MONDAY)
    assert_equal "Midweek days are soso.", tell_it_like_it_is(Day::WEDNESDAY)
    assert_equal "Fridays are better.", tell_it_like_it_is(Day::FRIDAY)
    assert_equal "Weekends are best.", tell_it_like_it_is(Day::SATURDAY)
    assert_equal "Weekends are best.", tell_it_like_it_is(Day::SUNDAY)
    assert_equal "Not a Day", tell_it_like_it_is(5)
  end

end

