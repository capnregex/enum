require 'enum'

class Foo < Enum
  FOO
  BAR(1,2,3)
  BLEEP
end

Foo::BUGGER(:off)

puts Foo.values.inspect
