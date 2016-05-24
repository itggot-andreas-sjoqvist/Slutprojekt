class User
  include DataMapper::Resource

  property :id, Serial
  property :f_name, String
  property :l_name, String
  property :password, BCryptHash, required: true
  property :email, String, required: true, unique: true

  has n, :categories
  has n, :projects, :through => Resource
  has n, :assignments, :through => Resource


  def name
    "#{f_name} #{l_name}"

  end

end