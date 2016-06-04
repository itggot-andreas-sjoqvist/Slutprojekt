class Assignment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :time, DateTime
  property :date, Date

  has n, :users, :through => Resource
  belongs_to :category
  has n, :days, :through => Resource

 end