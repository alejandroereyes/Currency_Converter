require 'minitest/autorun'
require_relative '../lib/Currency_converter_class.rb'

class TestCurrencyConverter < Minitest::Test

  def setup_converter
    converter = CurrencyConverter.new
  end

  def test_converter_has_rates
    setup_converter
    converter = CurrencyConverter.new
    conversion_rates = {"USD" => 1.00, "EUR"=> 0.89958, "GBP"=> 0.63840,"INR"=> 63.5795, "AUD"=> 1.26606, "CAD"=> 1.21981,"ZAR"=> 11.8514, "NZD"=> 1.36116, "JPY"=> 121.026}
    assert_equal(conversion_rates, converter.rates)
  end

  def test_converter
    setup_converter
    converter = CurrencyConverter.new
    assert_equal(0.89, converter.convert("USD", 1.00, "EUR"))
    assert_equal(63.57, converter.convert("USD", 1.00, "INR"))
    assert_equal(0.70, converter.convert("EUR", 1.00, "GBP"))
  end
end
