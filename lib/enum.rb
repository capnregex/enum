# Enum
class Enum
  VERSION = '1.0.3'
  include Comparable

  protected
  def init *args
    self.class.fields.each do |field|
      instance_variable_set("@#{field}",args.shift)
    end
  end

  def initialize *args, &block
    @id = self.class.next_ordinal
    sym = args.shift
    @sym = sym.to_sym
    @serialization_sym = @sym.to_s.downcase.to_sym
    @name = args.shift || sym.to_s
    init(*args)
    if block
      instance_eval( &block )
    end
  end

  public
  
  attr_reader :id
  alias ordinal id

  def <=> other
    if self.class == other.class
      ordinal <=> other.ordinal
    else
      nil
    end
  end

  def to_sym; @serialization_sym; end
  def to_s; @name ;end
  alias name to_s
  alias title to_s

  def to_i; @id; end

  def inspect;"#{self.class}::#{@sym}";end

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

    def value_of val
      case val
        when Integer then find val
        when String then const_get val.upcase.to_sym
        when Symbol then const_get val.to_s.upcase.to_sym
        else raise ArgumentError, "Cannot deserialize from #{val}: no valid type mapping for #{val.class}"
      end
    end

    def each
      values.each do |value|
        yield value
      end
    end

    def next_ordinal
      o = @next_ordinal ||= 0
      @next_ordinal = o + 1
      o
    end

    # Look-up an enum instance using the given field name with the given value.
    # @param [Symbol] field_name the field name to lookup on
    # @param [Object] value the value to lookup with
    # @return [Enum] the enum instance that corresponds to the given value, or nil if there is no such instance
    # @raise [NameError] if the field name given does not exist
    def lookup_by(field_name, value)
      if !fields.include?(field_name)
        raise NameError, "Attribute #{field_name} does not exist on this enum.  Valid attributes are: [#{fields.join(', ')}]"
      end
      memo_var_name = "@#{field_name}_reverse_lookup_memo"
      lookup_map = if instance_variable_defined?(memo_var_name)
                     instance_variable_get(memo_var_name)
                   else
                     instance_variable_set(memo_var_name, compute_reverse_lookup_map(field_name))
                   end
      lookup_map[value]
    end

    protected

    def start_at i
      @next_ordinal = i
    end

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

    def enum_sym arg
      arg = arg.to_s.upcase
      case arg
        when /\s/
          arg.gsub(/\s+/,'_').to_sym
        else
          arg.to_sym
      end
    end

    def add_enum *args, &block
      c = args.shift
      name = c.to_s
      if name !~ /^[A-Z_][A-Z0-9_]*$/
        raise ArgumentError, "Enum names must be constant-cased, matching /^[A-Z_][A-Z0-9_]*$/. Name #{name} does not match"
      end
      sym = enum_sym(c)
      if const_defined? sym
        raise ArgumentError, "Attempt to redefine enumerated value #{sym}, already defined as #{const_get sym}"
      else
        value = new(sym,name,*args,&block)
        values.push value
        const_set(sym,value)
        value
      end
    end

    def compute_reverse_lookup_map(field_name)
      values.inject({}) do |memo, enum_value|
        memo[enum_value.send(field_name)] = enum_value
        memo
      end
    end
  end

  # use the Enumeration class to constrain the scope of where the Enum definition
  # can take place.
  class Enumeration
    def initialize parent, *args, &block
      @parent = parent
      instance_eval(&block)
    end
    protected

    def method_missing *args, &block
      @parent.send :add_enum, *args, &block
    end
  end

end
