
require 'enum'

class Card < Enum
  enum_fields :rank, :suit
  
  class Rank < Enum
    start_at 2
    enum %w(DEUCE THREE FOUR FIVE SIX SEVEN EIGHT NINE TEN JACK QUEEN KING ACE)
  end
  
  class Suit < Enum
    enum %w(CLUBS DIAMONDS HEARTS SPADES)
  end

  Suit.each do |suit|
    Rank.each do |rank|
      add_enum "#{rank}_OF_#{suit}", rank, suit
    end
  end

end

