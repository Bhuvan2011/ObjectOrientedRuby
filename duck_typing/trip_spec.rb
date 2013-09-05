require_relative "../duck_typing/trip"

describe :Trip do
  
  let(:trip) { Trip.new() }

  describe :initialize do

    subject { trip }

    it { should_not be nil }
    it { should respond_to(:vehicle) }
    it { should respond_to(:bicycles) }
    it { should respond_to(:customers) }

    it { should respond_to(:prepare) }

  end

  describe :prepare do

    subject { trip.prepare(preparers) } 

    context "when there are no preparers" do
      let!(:preparers) { [] }

      it { should == "There are no preparers" }

    end

    context "when there are preparers" do

      let!(:trip_cordinator){ double(:trip_cordinator) }
      let!(:mechanic) { double(:mechanic) }
      let!(:driver){ double(:driver) }


      let(:preparers) { [mechanic,trip_cordinator, driver] }

      let!(:prepare_trip){ Object.any_instance.stub(:prepare_trip).and_return(:true) }


      context  "should have everything prepared" do

        it { should == ['true', mechanic, driver] }
      end

      context "when some tasks are not prepared" do
      end
    end


  end

end