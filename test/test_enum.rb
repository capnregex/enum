
require "test/unit"
require "enum"

class TestEnum < Test::Unit::TestCase
  def test_sanity
    assert Enum
  end
  
  def test_duplicate_definition_of_constant_raises_exception
    assert_raise ArgumentError do
      self.class.class_eval("
        class DuplicateDefinitionEnum < Enum
          enum do
            ENUM_1()
            ENUM_1()
          end
        end")
    end
  end

  def test_method_argument_form_of_enum_declaration_creates_appropriate_enum_values
    assert !MethodArgumentEnum::A.nil?
    assert !MethodArgumentEnum::B.nil?
    assert !MethodArgumentEnum::C.nil?
  end
  
  
  class MethodArgumentEnum < Enum 
    enum("A", "B", "C")
  end  
end

