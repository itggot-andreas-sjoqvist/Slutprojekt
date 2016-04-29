class Seeder

  def self.seed!
    self.users
    self.projects
    self.rolls
    self.assignments
    self.categories
    self.days
    self.plans

  end

  def self.users
    User.create(f_name: 'Steffe',
                l_name: 'Glennsson',
                password: 'dinmamma',
                email: 'tvarfran@gmail.com')
  end

  def self.projects
    Project.create(name: 'NP Matte',
                   start_date:Date.new(2016,5,1),
                   end_date: Date.new(2016,5,22),
                   description: 'I am very big boat. Are you very big boat?')

  end

  def self.assignments
    Assignment.create(name: 'Gör uppg. 1415-1422',
                      description: 'Aah, exakt',
                      time: DateTime.new(19.00),
                      date: Date.new(2016,5,4))

  end

  def self.rolls

  end

  def self.plans

  end

  def self.days

  end

  def self.categories

  end
end