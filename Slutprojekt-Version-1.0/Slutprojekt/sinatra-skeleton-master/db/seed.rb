require 'date'

class Seeder

  def self.seed!
    self.users
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



  def self.assignments

end
  def self.categories




  end

  def self.days
    day = DateTime.now

    3650.times do
      day = day.next
    Day.create(date: day)
      end
    end




  def AssignmentDay
   AssignmentDay.create(:assignment => assignment, :day => day)
  end

end
