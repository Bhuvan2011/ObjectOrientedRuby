class Bicycle

  attr_reader :size, :chain, :tire_size

  def initialize(args)
    @size = args[:size]
    @chain = args[:chain] ||default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def spares
    {tire_size: tire_size, chain: chain}.merge(local_spares)
  end

  def local_spares
    {}
  end

  def post_initialize(args)
    nil
  end

  def default_chain 
    40
  end

  def default_tire_size
    raise NotImplementedError
  end

end