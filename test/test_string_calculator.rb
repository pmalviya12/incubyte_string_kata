require 'minitest/autorun'
require_relative '../lib/string_calculator'

class TestStringCalculator < Minitest::Test
  def setup
    @calc = StringCalculator.new
  end

  def test_empty_string_returns_zero
    assert_equal 0, @calc.add('')
  end

  def test_single_number
    assert_equal 1, @calc.add('1')
  end

  def test_two_numbers_comma_separated
    assert_equal 6, @calc.add('1,5')
  end

  def test_multiple_numbers
    assert_equal 15, @calc.add('1,2,3,4,5')
  end

  def test_newlines_between_numbers
    assert_equal 6, @calc.add("1\n2,3")
  end

  def test_custom_single_char_delimiter
    assert_equal 3, @calc.add("//;\n1;2")
  end

  def test_custom_multi_char_and_multiple_delimiters
    assert_equal 6, @calc.add("//[***][%]\n1***2%3")
  end

  def test_negative_numbers_raise_with_all_negatives_listed
    err = assert_raises(ArgumentError) { @calc.add("1,-2,3,-4") }
    assert_equal 'negative numbers not allowed -2,-4', err.message
  end
end
