require_relative './post'

class Article < Post
  
  key :body,         String
  key :body_html,    String
  
  attr_accessible :body
  
  validates_presence_of :body
  
  before_save :format_content
  
  protected
  
  def format_content
    self.body_html = markdown.render(body).strip
  end
  
end