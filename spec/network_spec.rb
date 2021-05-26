require 'rspec'
require './lib/doctor'
require './lib/hospital'
require './lib/network'

RSpec.describe Network do

  before(:each) do
    @gsmn = Network.new("Greater Seattle Medical Network")

    @meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
    @alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "Johns Hopkins University", salary: 90_000})
    @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])

    @miranda = Doctor.new({name: "Miranda Bailey", specialty: "General Surgery", education: "Stanford University", salary: 150_000})
    @derek = Doctor.new({name: "Derek Sheperd", specialty: "Neurosurgery", education: "University of Pennsylvania", salary: 125_000})
    @grey_sloan = Hospital.new("Grey Sloan Memorial", "Larry Maxwell", [@miranda, @derek])
  end

  describe 'Object Creation' do

    it 'exists' do
      expect(@gsmn).to be_an_instance_of(Network)
    end

    it 'has readable attributes' do
      expect(@gsmn.name).to be_an_instance_of(String)
      expect(@gsmn.name).to eq("Greater Seattle Medical Network")
      expect(@gsmn.hospitals).to be_an_instance_of(Array)
      expect(@gsmn.hospitals).to eq([])
    end

  end

  describe 'Object Methods' do

    before(:each) do
      @gsmn.add_hospital(@seattle_grace)
      @gsmn.add_hospital(@grey_sloan)
    end

    it 'can add hospital to network' do
      expected = [@seattle_grace, @grey_sloan]
      expect(@gsmn.hospitals).to eq(expected)
    end

    it 'can return the highest paid doctor in the network' do
      expect(@gsmn.highest_paid_doctor).to be_an_instance_of(Doctor)
      expect(@gsmn.highest_paid_doctor).to eq(@miranda)
    end

    it 'can return doctors name by hospital' do
      expected = {
        @seattle_grace => ["Meredith Grey", "Alex Karev"],
        @grey_sloan    => ["Miranda Bailey", "Derek Sheperd"]
      }
      expect(@gsmn.doctors_by_hospital).to be_an_instance_of(Hash)
      expect(@gsmn.doctors_by_hospital).to eq(expected)
    end

    xit 'can return doctors in the network by specialty' do
      expected = {
        "General Surgery"   => ["Meredith Grey", "Miranda Bailey"],
        "Pediatric Surgery" => ["Alex Karev"],
        "Neurosurgery"      => ["Derek Sheperd"]
      }
      expect(@gsmn.doctors_by_specialty).to be_an_instance_of(Hash)
      expect(@gsmn.doctors_by_specialty).to eq(expected)
    end

    it 'can return the average doctors salary in network' do
      expect(@gsmn.average_doctors_salary).to be_an_instance_of(Float)
      expect(@gsmn.average_doctors_salary).to eq(116250.00)
    end
  end

end
