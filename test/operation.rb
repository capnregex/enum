
require "enum"
class Operation < Enum
  enum do
    PLUS   { def evaluate x, y; x + y; end }
    MINUS  { def evaluate x, y; x - y; end }
    TIMES  { def evaluate x, y; x * y; end }
    DIVIDE { def evaluate x, y; x / y; end }
  end
end

