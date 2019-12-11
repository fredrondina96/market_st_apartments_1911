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
end
