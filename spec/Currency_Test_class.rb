require 'minitest/autorun'
require_relative '../lib/Currency_class.rb'

class Currency_Test < Minitest::Test

  def setup_Currency_class
    @currency = Currency.new("USD", 100_000_000)
  end

  def test_Currency_class_exists
    setup_Currency_class # Given
    assert(@currency) # Then
  end

  def test_currency_code_and_amount
   setup_Currency_class # Given
   assert_equal("USD", @currency.code) # Then
   assert_equal(100_000_000, @currency.amount)
  end

  def test_diff_instances_of_Currency_with_same_values
   setup_Currency_class # Given
   new_currency = Currency.new("USD", 100_000_000) # When
   assert_equal(new_currency.code,@currency.code) # Then
   assert_equal(new_currency.amount, @currency.amount)
  end

  def test_diff_instances_of_Currency_with_diff_values
    setup_Currency_class
    new_currency = Currency.new("NIO", 1_000)
    refute_equal(new_currency.code, @currency.code)
    refute_equal(new_currency.amount, @currency.amount)
  end
end # class
