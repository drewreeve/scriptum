class Post
  include MongoMapper::Document
  
  key :title, String
  key :slug,  String
  key :published, Boolean, :default => false
  
  timestamps!
  
  attr_accessible :title, :slug, :published
  
  validates_presence_of :title
  validates_uniqueness_of :slug
  
  before_save :generate_slug
  
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  
  protected
  
  def generate_slug
    formatted_slug = (slug.blank? ? title : slug).
      downcase.
      gsub(/[^\w \-]/i, ''). # Keep letters, numbers, underscores
      gsub(/[ \-]+/i, '-').  # Remove repeated separators (-)
      gsub(/^\-|\-$/i, '')   # Remove leading/trailing separators
    
    self.slug = formatted_slug
  end
  
  def markdown
    @@markdown
  end
  
end