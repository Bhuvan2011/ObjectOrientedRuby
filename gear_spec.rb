require_relative "../oor/gear"
require_relative "../oor/wheel"


describe :Gear do
  
  let(:wheel){ Wheel.new(20, 10) }
  let(:gear) { Gear.new(:chainring => 10, :cog => 20, :wheel => wheel) }

  context :intialize do
    subject { gear }

    context "when the correct variables are passed" do
      its(:chainring) { should == 10 }
      its(:cog) { should == 20 }
      its(:wheel) { should == wheel }

      it { should_not be nil }
      it { should respond_to(:ratio) }
      it { should respond_to(:gear_inches) }
      it { should respond_to(:diameter) }
      it { should respond_to(:defaults) }
    end

    context "when all the variables are not passed" do
      let(:gear) { Gear.new(:cog => 11, :wheel => wheel) }
      subject { gear }

      it { should_not be nil }
      its(:chainring) { should == 40 }
    end

  end # intialize

  context :diameter do
    subject { gear.diameter }

    it { should == 40 }
  end
  
end
