class Project
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :start_date, Date
  property :end_date, Date
  property :description, Text

  has n, :users, :through => Resource
  belongs_to :category
  has n, :assignments
  has n, :days



end