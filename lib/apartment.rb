class Apartment

attr_reader :attributes, :renter

  def initialize(attributes)
    @attributes = attributes
    @renter = nil
  end

  def number
    @attributes[:number]
  end

  def monthly_rent
    @attributes[:monthly_rent]
  end

  def bathrooms
    @attributes[:bathrooms]
  end

  def bedrooms
    @attributes[:bedrooms]
  end

  def add_renter(new_renter)
    @renter = new_renter
  end
end
