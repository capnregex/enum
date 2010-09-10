# Enum
class Enum 
protected 
  def init *args
  end
public
  attr_reader :id, :name
  def initialize *args
    @id = args.shift
    @name = args.shift
    init *args
  end
  def to_sym;name;end
  def to_s;name.to_s;end
  def to_i;@id;end
  def inspect;"#{self.class}::#{name}##{id}";end
  def save;end
  def save!;end
  class << self
    def values
      @values ||= []
    end
    alias all values
    def find id
      values[id]
    end
    def each
      values.each do |value|
	yield value
      end
    end
  protected
    def missing *args
      name = args.first
      value = new(values.length,*args)
      values.push value
      const_set(name,value)
      value
    end
    def method_missing *args
      missing *args
    end
    def const_missing *args
      missing *args
    end
  end
end
