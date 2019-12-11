require 'pry'

class Building

attr_reader :units, :annual_breakdown

  def initialize()
    @units = []
    @annual_breakdown = {}
  end

  def add_unit(new_unit)
    @units << new_unit
  end

  def average_rent
    average_rent = 0.0
    @units.each do |unit|
      average_rent += unit.monthly_rent
    end
    average_rent = (average_rent/@units.count)
    return average_rent
  end

  def renter_with_highest_rent
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

  def annual_breakdown
    year_rent = 0
      @units.each do |unit|
        if unit.renter != nil
          year_rent = (unit.monthly_rent * 12 )
          @annual_breakdown[unit.renter.name] = year_rent
        end
      end
      return @annual_breakdown
  end
end
