class User
  include MongoMapper::Document
  
  key :username, String
  
  validates :username, :presence => true, :uniqueness => true
  
end