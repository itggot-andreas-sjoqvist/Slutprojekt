class Assignment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :time, DateTime
  property :date, Date

  belongs_to :project
  belongs_to :category
  belongs_to :plan


end