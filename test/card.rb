
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

  class Deck 
    def initialize 
      @cards = Array.new(Card.values)
      shuffle
    end
    def draw
      if @cards.empty?
	shuffle
      end
      @cards.shift
    end
    def cards
      @cards
    end
    def shuffle
      old = @cards
      if old.empty?
	old = Array.new(Card.values)
      end
      @cards = []
      until old.empty?
	card = old.delete_at(rand(old.length))
	@cards.insert(rand(@cards.length),card)
      end
    end
  end

end

