require_relative "../oor/wheel"

describe :Wheel do 

  let!(:wheel) { Wheel.new(10 , 20) }

  describe :intialize do

    subject { wheel }

    context "when the correct arguments are given" do

      it { should_not be nil }
      its(:tire){ should == 20 }
      its(:rim) { should == 10 }
      it { should respond_to(:diameter) }

    end

    context "when the incorrect arguments are given" do
      it "should raise error" do
        expect{ Wheel.new() }.to raise_error()
      end
    end

  end # Initalize

  describe :diameter do

    subject { wheel.diameter }

    it { should == 50 }
  end #diameter

  describe :circumfrence do
    subject { wheel.circumfrence }
    let(:diameter) { wheel.stub(:diameter).to_return(20) }

    it { should == 157.07963267948966 }  
  end

end