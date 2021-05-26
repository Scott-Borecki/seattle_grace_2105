class Hospital

  attr_reader :name,
              :chief_of_surgery,
              :doctors

  def initialize(name, chief_of_surgery, doctors)
    @name             = name
    @chief_of_surgery = chief_of_surgery
    @doctors          = doctors
  end

  def total_salary
    doctors.sum { |doctor| doctor.salary }
  end

  def lowest_paid_doctor
    doctors.min_by { |doctor| doctor.salary }.name
  end

  def highest_paid_doctor
    doctors.max_by {|doctor| doctor.salary }
  end

  def specialties
    doctors.map { |doctor| doctor.specialty }
  end

  def doctors_by_name
    doctors.map { |doctor| doctor.name }
  end

  def doctors_by_specialty
    hash = Hash.new
    doctors.each do |doctor|
      specialty = doctor.specialty
      name = doctor.name
      if hash[specialty]
        hash[specialty] << name
      else
        hash[specialty] = [name]
      end
    end
    hash
  end

end
