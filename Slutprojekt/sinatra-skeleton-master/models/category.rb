class Category
  include DataMapper::Resource

  property :id, Serial
  property :name ,String
  property :color, String


end