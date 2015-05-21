require 'minitest/autorun'
require_relative '../lib/Currency_class.rb'

class Currency_Test < Minitest::Test

  def setup_Currency_class
    @currency = Currency.new("USD", 100_000_000)
  end

  def test_Currency_class_exists
    setup_Currency_class
    assert(@currency)
  end

  def test_currency_code_and_amount
   setup_Currency_class
   assert_equal("USD", @currency.code)
   assert_equal(100_000_000, @currency.amount)
  end

  def test_diff_instances_of_Currency_with_same_values
   setup_Currency_class # Given
   new_currency = Currency.new("USD", 100_000_000)
   assert_equal(new_currency.code,@currency.code)
   assert_equal(new_currency.amount, @currency.amount)
  end

  def test_double_equals
    setup_Currency_class
    new_currency = Currency.new("USD", 100_000_000)
    assert_equal(new_currency, @currency)
  end

  def test_diff_instances_of_Currency_with_diff_values
    setup_Currency_class
    new_currency = Currency.new("NIO", 1_000)
    refute_equal(new_currency.code, @currency.code)
    refute_equal(new_currency.amount, @currency.amount)
  end

  def test_add_currency_method
    setup_Currency_class
    new_currency = Currency.new("USD", 0)
    new_currency.add_currency(@currency.code, 100_000_000)
    assert_equal(100_000_000, new_currency.amount)
  end

  def test_subtract_currency_method
    setup_Currency_class
    new_currency = Currency.new("USD", 0)
    @currency.sub_currency(new_currency.code, 100_000_000)
    assert_equal(0, @currency.amount)
  end

  def test_dif_currency_error_message_with_add_method
    setup_Currency_class
    new_currency = Currency.new("NIO", 1_000)
    new_currency.add_currency(@currency.code, 1_000)
    assert_equal("Currencies do not match!", new_currency.add_currency(@currency.code, 1_000))
  end

  def test_dif_currency_error_message_with_sub_method
    setup_Currency_class
    new_currency = Currency.new("NIO", 1_000)
    @currency.add_currency(new_currency.code, 10_000)
    assert_equal("Currencies do not match!", new_currency.add_currency(@currency.code, 1_000))
  end

  def test_multiply_currency_method
    setup_Currency_class
    multiplier = 2.3
    assert_equal(Currency , @currency.multiply_currency(multiplier).class)
  end
end




















