class Post
  include MongoMapper::Document
  
  key :title, String
  key :slug,  String
  
  timestamps!
  
  validates_presence_of :title
  validates_uniqueness_of :slug
  
  before_save :generate_slug
  
  protected
  
  def generate_slug
    formatted_slug = (slug.blank? ? title : slug).
      downcase.
      gsub(/[^\w \-]/i, ''). # Keep letters, numbers, underscores
      gsub(/[ \-]+/i, '-').  # Remove repeated separators (-)
      gsub(/^\-|\-$/i, '')   # Remove leading/trailing separators
    
    self.slug = formatted_slug
  end
end