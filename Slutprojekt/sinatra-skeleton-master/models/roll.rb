class Role
  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :role, String

  has 1, :user
  belongs_to :project
end