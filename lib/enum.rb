# Enum
class Enum 
  include Comparable
protected 
  def init *args
    self.class.fields.each do |field|
      instance_variable_set("@#{field}",args.shift)
    end
  end
  def initialize *args
    @id = args.shift
    @name = args.shift
    init *args
  end
public
  attr_reader :id, :name
  alias ordinal id
  def to_sym;name;end
  def to_s;name.to_s;end
  def to_i;@id;end
  def to_f;@id.to_f;end
  def inspect;"#{self.class}::#{name}##{id}";end
  def save;end
  def save!;end
  class << self
    def values
      @values ||= []
    end
    def fields
      @fields ||= []
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
    def enum_fields *fields
      @fields = fields
      send :attr_reader, *fields
    end
    def missing *args
      name = args.first
      if name == name.to_s.upcase.to_sym
	if const_defined? name
	  const_get name
	else
	  value = new(values.length,*args)
	  values.push value
	  const_set(name,value)
	  value
	end
      else
	nil
      end
    end
    def method_missing *args
      missing(*args) || super
    end
    def const_missing *args
      missing(*args) || super
    end
  end
end
