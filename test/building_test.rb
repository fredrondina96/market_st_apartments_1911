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

end
