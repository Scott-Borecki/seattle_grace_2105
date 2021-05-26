class Doctor

  attr_reader :name,
              :specialty,
              :education,
              :salary

  def initialize(args)
    @name      = args[:name]
    @specialty = args[:specialty]
    @education = args[:education]
    @salary    = args[:salary]
  end

end
