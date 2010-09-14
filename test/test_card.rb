
require "test/unit"
require "card"

class TestEnum < Test::Unit::TestCase
  def test_card_sanity
    assert [], Card.values
  end
end

