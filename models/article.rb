require_relative './post'

class Article < Post
  
  key :excerpt,      String
  key :excerpt_html, String
  key :body,         String
  key :body_html,    String
  
  attr_accessible :body, :excerpt
  
  validates_presence_of :body
  
  before_save :format_content
  
  protected
  
  def format_content
    self.body_html = markdown.render(body).strip
    
    # Set excerpt to nil if not specified or removed so that an empty string
    # isn't saved in the database
    if excerpt.blank?
      self.excerpt = nil
      self.excerpt_html = nil
    else
      self.excerpt_html = markdown.render(excerpt).strip
    end
  end
  
end