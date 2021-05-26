require 'rspec'
require './lib/doctor'
require './lib/hospital'

RSpec.describe Hospital do

  before(:each) do
    @meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
    @alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
    @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
  end

  describe 'Object Creation' do

    it 'exists' do
      expect(@seattle_grace).to be_an_instance_of(Hospital)
    end

    it 'has readable attributes' do
      expect(@seattle_grace.name).to be_an_instance_of(String)
      expect(@seattle_grace.name).to eq("Seattle Grace")
      expect(@seattle_grace.chief_of_surgery).to be_an_instance_of(String)
      expect(@seattle_grace.chief_of_surgery).to eq("Richard Webber")
      expect(@seattle_grace.doctors).to be_an_instance_of(Array)
      expect(@seattle_grace.doctors).to eq([@meredith, @alex])
    end

  end

  describe 'Object Methods' do

    it 'can return the total salary of doctors' do
      expect(@seattle_grace.total_salary).to be_an_instance_of(Integer)
      expect(@seattle_grace.total_salary).to eq(190000)
    end

    it 'can return the lowest paid doctor name' do
      expect(@seattle_grace.lowest_paid_doctor).to be_an_instance_of(String)
      expect(@seattle_grace.lowest_paid_doctor).to eq("Alex Karev")
    end

    it 'can return the highest paid doctor' do
      expect(@seattle_grace.highest_paid_doctor).to be_an_instance_of(Doctor)
      expect(@seattle_grace.highest_paid_doctor).to eq(@meredith)
    end

    it 'can return specialties of doctors' do
      expected = ["General Surgery", "Pediatric Surgery"]
      expect(@seattle_grace.specialties).to be_an_instance_of(Array)
      expect(@seattle_grace.specialties).to eq(expected)
    end

    it 'can return doctors by name' do
      expected = ["Meredith Grey", "Alex Karev"]
      expect(@seattle_grace.doctors_by_name).to be_an_instance_of(Array)
      expect(@seattle_grace.doctors_by_name).to eq(expected)
    end

  end

end
