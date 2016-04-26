class Role
  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :role, String

  belongs_to
end