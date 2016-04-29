class Day
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  has n, :plans
end