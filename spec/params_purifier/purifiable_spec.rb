require 'spec_helper'

class DummyInterFaceForPurifiableWithError
  
  include ParamsPurifier::Purifiable

end

class DummyInterFaceForPurifiable
  
  include ParamsPurifier::Purifiable

  private

    def params  
      { "ids" => [""] }
    end

end


describe ParamsPurifier::Purifiable do

  describe "#purified_params" do

    it "raises error if interface doesn't implement params method" do
      expect do 
        DummyInterFaceForPurifiableWithError.new.purified_params
      end.to raise_error ParamsPurifier::Purifiable::ParamsMethodNotImplementedError
    end

    it "returns purified params" do
      result = { "ids" => [] }
      expect(DummyInterFaceForPurifiable.new.purified_params).to eq result
    end

    it "returns instance of ActionController::Parameters" do
      expect(DummyInterFaceForPurifiable.new.purified_params).to be_instance_of ActionController::Parameters
    end

  end

end