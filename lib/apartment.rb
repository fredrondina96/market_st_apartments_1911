class Apartment

attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
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
end
