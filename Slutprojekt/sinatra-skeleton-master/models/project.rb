class Project
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :s_date, Date
  property :e_date, Date
  property :description, Text


end