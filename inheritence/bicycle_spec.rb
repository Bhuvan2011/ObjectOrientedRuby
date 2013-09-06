require_relative "../inheritence/bicycle"

describe :Bicycle do

  subject { bicycle }

  describe :initialize do

    let!(:bicycle) { Bicycle.new(size: 10, chain: 20, tire_size: 30) }

    it{ should_not eq(:nil) }

    it { should respond_to(:size) }
    it { should respond_to(:chain) }
    it { should respond_to(:tire_size) }

    it { should respond_to(:post_initialize) }
    it { should respond_to(:default_chain) }
    it { should respond_to(:default_tire_size) }
    it { should respond_to(:spares) }

    context "when all the arguments are passed" do
      its(:size) { should == 10 }
      its(:chain) { should == 20 }
      its(:tire_size){ should == 30 }
    end

    context "when all the arguments are not passed " do
      let!(:bicycle) { Bicycle.new(size: 10, tire_size: 20) }

      it "should assing the default value to the chain" do
        expect(bicycle.chain).to eq 40
      end
    end

  end 

  describe :spares do
    
    let!(:bicycle) { Bicycle.new(size: 10, chain: 20, tire_size: 30) }
    let!(:local_spares){ bicycle.stub(:local_spares).and_return({padding: "white"}) }

    subject { bicycle.spares }

    it { should == {:tire_size=>30, :chain=>20, :padding=>"white"}}
    
  end

  describe :default_tire_size do

    it "should raise the exception if there is no default tire size method implemented" do
      expect{ Bicycle.new(size: 10, chain: 20) }.to raise_exception() 
    end
  end

end