require_relative '../lib/renter'
require_relative '../lib/apartment'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ApartmentTest < Minitest::Test

  def setup
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_apartment_exists
    assert_instance_of Apartment, @unit1
  end

  def test_attributes_are_stored_in_hash
    assert_equal "A1", @unit1.attributes[:number]
    assert_equal 1200, @unit1.attributes[:monthly_rent]
    assert_equal 1, @unit1.attributes[:bathrooms]
    assert_equal 1, @unit1.attributes[:bedrooms]
  end

  def test_attributes_can_be_accessed_with_method
    assert_equal "A1", @unit1.number
    assert_equal 1200, @unit1.monthly_rent
    assert_equal 1, @unit1.bathrooms
    assert_equal 1, @unit1.bedrooms
  end
end
