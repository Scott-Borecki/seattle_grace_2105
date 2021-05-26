require 'rspec'
require './lib/doctor'

RSpec.describe Doctor do

  before(:each) do
    @meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
  end

  describe 'Object Creation' do

    it 'exists' do
      expect(@meredith).to be_an_instance_of(Doctor)
    end

    it 'has readable attributes' do
      expect(@meredith.name).to be_an_instance_of(String)
      expect(@meredith.name).to eq("Meredith Grey")
      expect(@meredith.specialty).to be_an_instance_of(String)
      expect(@meredith.specialty).to eq("General Surgery")
      expect(@meredith.education).to be_an_instance_of(String)
      expect(@meredith.education).to eq("Harvard University")
      expect(@meredith.salary).to be_an_instance_of(Integer)
      expect(@meredith.salary).to eq(100000)
    end

  end
end
