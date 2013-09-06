require_relative "../inheritence/bicycle"

class RoadBike < Bicycle

  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def default_tire_size
    10
  end

  def local_spares
    {tape_color: tape_color}
  end

end