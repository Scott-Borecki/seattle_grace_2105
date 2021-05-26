class Network

  attr_reader :name,
              :hospitals

  def initialize(name)
    @name      = name
    @hospitals = []
  end

  def add_hospital(hospital)
    @hospitals << hospital
  end

  def highest_paid_doctor
    hospitals.max_by { |hospital| hospital.highest_paid_doctor.salary }.highest_paid_doctor
  end

  def doctors_by_hospital
    hash = Hash.new
    hospitals.map do |hospital|
      hash[hospital] = hospital.doctors_by_name
    end
    hash
  end

  def doctors_by_specialty
    hash = Hash.new { |hash, key| hash[key] = []}
    hospitals.select do |hospital|
      hospital.doctors.select do |doctor|
        hash[doctor.specialty] << doctor.name
      end
    end
    hash
  end

  def average_doctors_salary
    total_salary = hospitals.sum { |hospital| hospital.total_salary }
    num_doctors = hospitals.sum { |hospital| hospital.doctors.length }
    total_salary.fdiv(num_doctors)
  end

end
