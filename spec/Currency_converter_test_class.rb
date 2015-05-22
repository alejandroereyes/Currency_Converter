require 'minitest/autorun'
require_relative '../lib/Currency_converter_class.rb'
require_relative '../lib/Currency_class.rb'

class TestCurrencyConverter < Minitest::Test

  def setup_converter
    @converter = CurrencyConverter.new
  end

  def test_converter_has_rates
    setup_converter
    converter = CurrencyConverter.new
    conversion_rates = {"USD" => 1.00, "EUR"=> 0.89958, "GBP"=> 0.63840,"INR"=> 63.5795, "AUD"=> 1.26606, "CAD"=> 1.21981,"ZAR"=> 11.8514, "NZD"=> 1.36116, "JPY"=> 121.026}
    assert_equal(conversion_rates, converter.rates)
  end

  def test_converter_math
    setup_converter
    converter = CurrencyConverter.new
    assert_equal(0.89, converter.convert_math("USD", 1.00, "EUR"))
    assert_equal(63.57, converter.convert_math("USD", 1.00, "INR"))
    assert_equal(0.70, converter.convert_math("EUR", 1.00, "GBP"))
  end

  def test_converter_method_returns_equal_currency_when_rerquested
    setup_converter
    us_money = Currency.new("USD", 1_000)
    also_us_money = @converter.convert(us_money, "USD")
    assert_equal(us_money, also_us_money)
  end

  def test_converter_returns_correct_diff_currency
    setup_converter
    us_money = Currency.new("USD", 1_000)
    uk_money = @converter.convert(us_money, "GBP")
    yen_money = @converter.convert(uk_money, "JPY")
    assert_equal(Currency, uk_money.class)
    assert_equal("GBP", uk_money.code)
    assert_equal(638.40, uk_money.amount)
    assert_equal(121_026, yen_money.amount)
    assert_equal("JPY", yen_money.code)
  end

  def test_converter_raises_error_with_unknown_currency_code
    setup_converter
    us_money = Currency.new("USD", 1_000)
    assert_raises(Unknown_Currency_Code_Error){ @converter.convert(us_money, "OOP") }
  end
end
