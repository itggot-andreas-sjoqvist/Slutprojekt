class Seeder

  def self.seed!
    self.users
    self.projects
    self.assignments



  end

  def self.users
    User.create(f_name: 'Steffe',
                l_name: 'Glennsson',
                password: 'dinmamma',
                email: 'tvarfran@gmail.com',
                role_id: 1)
  end

  def self.projects
    p 'hello'
    Project.create(name: 'NP Matte',
                   start_date: Date.new(2016,5,1),
                   end_date: Date.new(2016,5,22),
                   description: 'I am very big boat. Are you very big boat?',
                   user_id: 1,
                   category_id: 1)

    Project.create(name: 'Bror',
                   start_date:Date.new(2017,2,2),
                   end_date: Date.new(2017,2,15),
                   description: 'I am very big boat. Are you very big boat?',
                   user_id: 2,
                   category_id: 2
                    )
  end

  def self.assignments
    Assignment.create(name: 'Gör uppg. 1415-1422',
                      description: 'Aah, exakt',
                      time: DateTime.new(19.00),
                      date: Date.new(2016,5,4),
                      project_id: 2,
                      category_id: 2,
                      plan_id: 1,
                      user_id: 2
                      )
  end


end