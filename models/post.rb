class Post
  include MongoMapper::Document
  
  key :title, String
  key :slug,  String
  key :published, Boolean, :default => false
  key :tags, Array
  
  timestamps!
  
  attr_accessible :title, :slug, :published, :tags_string
  
  validates_presence_of :title
  validates_uniqueness_of :slug
  
  before_save :generate_slug
  
  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  
  def tags_string=(str)
    self.tags = str.split(",").map(&:strip).uniq
  end
  
  def tags_string
    tags ? tags.join(", ") : ""
  end
  
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