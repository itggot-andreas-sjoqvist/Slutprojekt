class Assignment
  include DataMapper::Resource

  property :id, Serial
  property :description, Text
  property :time, Datetime
  property :date, Date


end