# Enum
class Enum 
  VERSION = '1.0.0'
  include Comparable
protected 
  def init *args
    self.class.fields.each do |field|
      instance_variable_set("@#{field}",args.shift)
    end
  end
  def initialize *args
    @id = args.shift
    @sym = args.shift
    @name = args.shift
    init(*args)
  end
public
  attr_reader :id
  alias ordinal id
  def to_sym;@sym;end
  def to_s;@name;end
  alias name to_s
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
    def enum *args, &block
      unless args.empty?
	if args.length == 1 and ( arg = args.first ) and arg.kind_of? Array
	  arg.each do |a|
	    add_enum a
	  end
	else
	  args.each do |arg|
	    add_enum arg
	  end
	end
      end
      if block
        Enumeration.new self, &block
      end
      nil
    end
    def next_ordinal
      values.length
    end
    def enum_sym arg
      arg = arg.to_s.upcase
      case arg
      when /\s/ 
        arg.gsub(/\s+/,'_').to_sym
      else 
	arg.to_sym
      end
    end
    def add_enum *args
      c = args.shift
      name = c.to_s
      sym = enum_sym(c)
      if const_defined? sym
	const_get sym 
      else
	value = new(next_ordinal,sym,name,*args)
	values.push value
	const_set(sym,value)
	value
      end
    end
  end

  # use the Enumeration class to constrain the scope of where the Enum definition can take place. 
  class Enumeration
    def initialize parent, *args, &block
      @parent = parent
      instance_eval(&block)
    end
  protected
    def method_missing *args
      @parent.send :add_enum, *args
    end
    def const_missing *args
      @parent.send :add_enum, *args
    end
  end

end
