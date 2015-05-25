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

  def test_double_equals_override
    setup_Currency_class
    new_currency = Currency.new("USD", 100_000_000)
    assert_equal(true, new_currency == @currency)
  end

  def test_diff_instances_of_Currency_with_diff_values
    setup_Currency_class
    new_currency = Currency.new("NIO", 1_000)
    refute_equal(new_currency.code, @currency.code)
    refute_equal(new_currency.amount, @currency.amount)
  end

  def test_addition_override
    setup_Currency_class
    new_currency = Currency.new("USD", 100_000_000)
    assert_equal(200_000_000, @currency + new_currency)
  end

  def test_add_currency_method
    setup_Currency_class
    new_currency = Currency.new("USD", 0)
    new_currency.add_currency(@currency.code, 100_000_000)
    assert_equal(100_000_000, new_currency.amount)
  end

  def test_substraction_override
    setup_Currency_class
    new_currency = Currency.new("USD", 999)
    @currency - new_currency
    assert_equal(99_999_001, @currency.amount)
  end

  def test_subtract_currency_method
    setup_Currency_class
    new_currency = Currency.new("USD", 0)
    @currency.sub_currency(new_currency.code, 100_000_000)
    assert_equal(0, @currency.amount)
  end

  def test_multiplication_override
    setup_Currency_class
    new_currency = @currency * 2.3
    assert_equal(230_000_000.00, new_currency.amount)
    assert_equal(Currency, new_currency.class)
    assert_equal("USD", new_currency.code)
  end

  def test_dif_currency_error_message_with_add_override
    setup_Currency_class
    new_currency = Currency.new("NIO", 1_000)
    assert_raises(Different_Currency_Code_Error){ @currency + new_currency }
  end

  def test_dif_currency_error_message_with_sub_override
    setup_Currency_class
    new_currency = Currency.new("NIO", 1_000)
    assert_raises(Different_Currency_Code_Error){ @currency - new_currency }
  end

  def test_multiply_currency_method
    setup_Currency_class
    multiplier = 2.3
    assert_equal(Currency , @currency.multiply_currency(multiplier).class)
    assert_equal(230_000_000, @currency.multiply_currency(multiplier).amount)
  end

  def test_currency_initialize_with_monetary_symbols
    cash_money = Currency.new("¥121.40")
    assert_equal('JPY', cash_money.code)
    assert_equal(121.40, cash_money.amount)
  end
end




















