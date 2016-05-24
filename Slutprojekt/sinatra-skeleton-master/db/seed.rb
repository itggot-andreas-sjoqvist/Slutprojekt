class Seeder

  def self.seed!
    self.users
    self.projects
    self.assignments
    self.categories
    self.days




  end

  def self.users


   User.create(f_name: 'Steffe',
                l_name: 'Glennsson',
                password: 'dinmamma',
                email: 'tvarfran@gmail.com')


  end





  def self.projects

    Project.create(name: 'NP Matte',
                   start_date: Date.new(2016,5,1),
                   end_date: Date.new(2016,5,22),
                   description: 'I am very big boat. Are you very big boat?',
                   category_id: 1)


  end




  def self.assignments

  end
  def self.categories

  end


  def self.days
    day = Day.create(date: Date.new(2016,5,20))
    day.assignments << @assignments

  end

  def AssignmentDay
   AssignmentDay.create(:assignment => assignment, :day => day)
  end


  end