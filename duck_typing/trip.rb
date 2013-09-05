class Trip 
  attr_reader :vehicle, :bicycles, :customers

  def prepare(preparers)
    if preparers.any?
      preparers.each {|preparer|
        preparer.prepare_trip(self)
      }
    else
      "There are no preparers"
    end
  end

end