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
    def enumerate *args, &block
      puts "#{self}.enumerate"
      e = Enumeration.new self
      e.module_eval &block
    end
    def missing *args
      name = args.first
      if name == name.to_s.upcase.to_sym
	if parent.const_defined? name
	  parent.const_get name
	else
	  value = parent.new(values.length,*args)
	  parent.values.push value
	  parent.const_set(name,value)
	  value
	end
      else
	nil
      end
    end
  end

  class Enumeration
    def initialize parent, *args
      @parent = parent
    end
  protected
    def parent
      @parent
    end
    def method_missing *args
      parent.send :missing, *args
    end
    def const_missing *args
      parent.send :missing, *args
    end
  end

end
