require 'pry'

class Building

attr_reader :units

  def initialize()
    @units = []
  end

  def add_unit(new_unit)
    @units << new_unit
  end

  def average_rent
    #use iteration to sum the .monthly_rent of units
    average_rent = 0.0
    @units.each do |unit|
      average_rent += unit.monthly_rent
    end
    average_rent = (average_rent/@units.count)
    return average_rent
  end

  def renter_with_highest_rent
    #iterate through units with renter
    #use each to only store the unit that has a renter AND the highest rent
    high_rent_renter = nil
    @units.each do |unit|
        if (unit.renter != nil && (high_rent_renter == nil))
          high_rent_renter = unit
        elsif (unit.renter != nil && (high_rent_renter != nil))
          if high_rent_renter.monthly_rent < unit.monthly_rent
            high_rent_renter = unit
          end
        end
    end
  return high_rent_renter.renter
end
end
