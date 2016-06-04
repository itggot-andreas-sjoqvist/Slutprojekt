class Assignment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :time, DateTime

  has n, :users, :through => Resource
  belongs_to :category
  belongs_to :day


end