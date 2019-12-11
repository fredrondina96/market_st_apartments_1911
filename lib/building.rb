class Building

attr_reader :units

  def initialize()
    @units = []
  end

  def add_unit(new_unit)
    @units << new_unit
  end
end
