require 'minitest/autorun'
require_relative '../lib/Currency_class.rb'

class Currency_Test < Minitest::Test

  def setup_Currency_class
    @currency = Currency.new
  end

  def test_Currency_class_exists
    setup_Currency_class # Given
    assert(@currency) # Then
  end
end # class
