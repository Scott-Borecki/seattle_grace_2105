class Network

  attr_reader :name,
              :hospitals

  def initialize(name)
    @name = name
    @hospitals = []
  end

  def add_hospital(hospital)
    @hospitals << hospital
  end

  def highest_paid_doctor # Refactor if time permits
    hospitals.max_by { |hospital| hospital.highest_paid_doctor.salary }.highest_paid_doctor
  end

  def doctors_by_hospital # Refactor if time permits
    doctors_by_hospital = Hash.new
    hospitals.map do |hospital|
      doctors_by_hospital[hospital] = hospital.doctors_by_name
    end
    doctors_by_hospital
  end

end
