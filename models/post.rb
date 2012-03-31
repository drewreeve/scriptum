class Post
  include MongoMapper::Document
  
  key :title,     String
  key :slug,      String
  key :published, Boolean, :default => false
  key :tags,      Array
  
  timestamps!
  
  belongs_to :user

  attr_accessible :title, :slug, :published, :tags_string
  
  validates_presence_of   :title
  validates_uniqueness_of :slug
  validates_presence_of   :user
  
  before_save :generate_slug
  
  def tags_string=(str)
    self.tags = str.split(",").map(&:strip).uniq
  end
  
  def tags_string
    tags ? tags.join(", ") : ""
  end
  
  def self.search(query)
    query ? where(:title => /#{query}/i) : self
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
  
  def markdown_to_html(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :fenced_code_blocks => true)
    @markdown.render(text)
  end
  
end
