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


  end

  def self.assignments


  def self.categories




  end

  def self.days

  end

  def AssignmentDay
   AssignmentDay.create(:assignment => assignment, :day => day)
  end

  end
  end