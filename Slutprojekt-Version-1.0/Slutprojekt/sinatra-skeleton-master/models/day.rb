class Day
  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime, default: Time.now

  has n, :assignments, :through => Resource


end