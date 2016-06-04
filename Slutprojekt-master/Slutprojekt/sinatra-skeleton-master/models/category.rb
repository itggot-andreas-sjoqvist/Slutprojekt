class Category
  include DataMapper::Resource

  property :id, Serial
  property :name ,String

  belongs_to :user
  has n, :assignments
  has n, :projects

end