
require "test/unit"
require "card"
require "deck"

class TestDeck < Test::Unit::TestCase
  def test_card_deck
    deck = Deck.new.shuffle
    assert_not_equal Card.values, deck.cards
    assert_equal Card.values, deck.cards.sort
  end
end

