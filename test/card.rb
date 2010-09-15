
require 'enum'

class Card < Enum
  enum_fields :rank, :suit
  
  class Rank < Enum
    start_at 2
    enum %w(Deuce Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace)
  end
  
  class Suit < Enum
    enum %w(Clubs Diamonds Hearts Spades)
  end

  Suit.each do |suit|
    Rank.each do |rank|
      add_enum "#{rank} of #{suit}", rank, suit
    end
  end

end

