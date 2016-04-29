class Plan
include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :assignments
end