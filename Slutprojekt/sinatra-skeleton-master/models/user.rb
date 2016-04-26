class User
  include DataMapper::Resource

  property :id, Serial
  property :namn, String
  property :password, BCryptHash, required: true
  property :email, String, unique: true
  property :pbild,

  has n, :assignments
  has n, :roles




end