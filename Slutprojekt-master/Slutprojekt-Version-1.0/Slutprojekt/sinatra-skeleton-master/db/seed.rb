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
    day = Date.today

    2650.times do
      Day.create(date: day)
      day = day.next
    end
  end


end


