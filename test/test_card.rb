
require "test/unit"
require "card"

class TestCard < Test::Unit::TestCase
  def test_card_sanity
    assert_equal Card::Rank::TEN.to_i, 10
    assert_equal [Card::Suit::CLUBS, Card::Suit::DIAMONDS, Card::Suit::HEARTS,
      Card::Suit::SPADES], Card::Suit.values
    assert_equal [Card::Rank::DEUCE, Card::Rank::THREE, Card::Rank::FOUR,
      Card::Rank::FIVE, Card::Rank::SIX, Card::Rank::SEVEN, Card::Rank::EIGHT,
      Card::Rank::NINE, Card::Rank::TEN, Card::Rank::JACK, Card::Rank::QUEEN,
      Card::Rank::KING, Card::Rank::ACE], Card::Rank.values
    assert_equal [Card::DEUCE_OF_CLUBS, Card::THREE_OF_CLUBS,
      Card::FOUR_OF_CLUBS, Card::FIVE_OF_CLUBS, Card::SIX_OF_CLUBS,
      Card::SEVEN_OF_CLUBS, Card::EIGHT_OF_CLUBS, Card::NINE_OF_CLUBS,
      Card::TEN_OF_CLUBS, Card::JACK_OF_CLUBS, Card::QUEEN_OF_CLUBS,
      Card::KING_OF_CLUBS, Card::ACE_OF_CLUBS, Card::DEUCE_OF_DIAMONDS,
      Card::THREE_OF_DIAMONDS, Card::FOUR_OF_DIAMONDS, Card::FIVE_OF_DIAMONDS,
      Card::SIX_OF_DIAMONDS, Card::SEVEN_OF_DIAMONDS, Card::EIGHT_OF_DIAMONDS,
      Card::NINE_OF_DIAMONDS, Card::TEN_OF_DIAMONDS, Card::JACK_OF_DIAMONDS,
      Card::QUEEN_OF_DIAMONDS, Card::KING_OF_DIAMONDS, Card::ACE_OF_DIAMONDS,
      Card::DEUCE_OF_HEARTS, Card::THREE_OF_HEARTS, Card::FOUR_OF_HEARTS,
      Card::FIVE_OF_HEARTS, Card::SIX_OF_HEARTS, Card::SEVEN_OF_HEARTS,
      Card::EIGHT_OF_HEARTS, Card::NINE_OF_HEARTS, Card::TEN_OF_HEARTS,
      Card::JACK_OF_HEARTS, Card::QUEEN_OF_HEARTS, Card::KING_OF_HEARTS,
      Card::ACE_OF_HEARTS, Card::DEUCE_OF_SPADES, Card::THREE_OF_SPADES,
      Card::FOUR_OF_SPADES, Card::FIVE_OF_SPADES, Card::SIX_OF_SPADES,
      Card::SEVEN_OF_SPADES, Card::EIGHT_OF_SPADES, Card::NINE_OF_SPADES,
      Card::TEN_OF_SPADES, Card::JACK_OF_SPADES, Card::QUEEN_OF_SPADES,
      Card::KING_OF_SPADES, Card::ACE_OF_SPADES], Card.values
  end
end

