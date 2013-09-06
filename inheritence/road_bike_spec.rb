require_relative "../inheritence/road_bike"

describe :RoadBike  do
  
  subject { road_bike }

  describe :initialize do
    let!(:road_bike) { RoadBike.new(size: 10, tire_size: 10) }


    it { should_not eql(:nil) }

    it { should respond_to(:tape_color) }
    it { should be_kind_of(Bicycle)}

    it { should respond_to(:post_initialize) }
    it { should respond_to(:default_tire_size) }
    it { should respond_to(:local_spares) }

    its(:size) { should == 10 }
    its(:chain) { should == 40 }
  end

  describe :default_tire_size do
    let!(:road_bike) { RoadBike.new(size: 10) }

    its(:tire_size) { should == 10 }
  end

  describe :post_initialize do
    let!(:road_bike) { RoadBike.new(size: 10, tape_color: "white", tire_size: 10) }

    its(:tape_color){ should == "white"}
  end

  describe :local_spares do
    let!(:road_bike) { RoadBike.new(size: 10, tire_size: 10, chain: 20, tape_color: "white") }

    subject { road_bike.spares }

    it { should == {:tire_size=>10, :chain=>20, :tape_color=>"white"} }

  end

end
