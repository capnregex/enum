
require 'card'

class Deck 

  def initialize *args
    @cards = Array.new( Card.values )
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
      @cards.push old.delete_at(rand(old.length))
    end
    self
  end

end


