class User
  include DataMapper::Resource

  property :id, Serial
  property :f_name, String
  property :l_name, String
  property :password, BCryptHash, required: true
  property :email, String, unique: true


  has n, :assignments
  has n, :roles

end