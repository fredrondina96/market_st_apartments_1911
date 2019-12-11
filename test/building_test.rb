require_relative '../lib/renter'
require_relative '../lib/apartment'
require_relative '../lib/building'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class BuildingTest < Minitest::Test

  def setup
      @building = Building.new
      @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
      @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
      @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
      @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})
      @renter1 = Renter.new("Spencer")
      @renter2 = Renter.new("Jessie")
      @renter3 = Renter.new("Max")
  end

  def test_building_exists
    assert_instance_of Building, @building
  end

  def test_units_can_be_added_to_building
    assert_equal [], @building.units
    @building.add_unit(@unit1)
    assert_equal @building.units[0], @unit1
    @building.add_unit(@unit2)
    assert_equal @building.units[1], @unit2
  end

  def test_average_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter1)
    assert_equal @building.renter_with_highest_rent, @renter1
    @unit1.add_renter(@renter2)
    assert_equal @building.renter_with_highest_rent, @renter2
    @unit3.add_renter(@renter3)
    assert_equal @building.renter_with_highest_rent, @renter2
  end

  def test_annual_breakdown
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(@renter1)
    expected = {"Spencer"=>11988}
    assert_equal expected, @building.annual_breakdown
    @unit1.add_renter(@renter2)
    expected = {"Jessie" => 14400, "Spencer" => 11988}
    assert_equal expected, @building.annual_breakdown
  end

end
