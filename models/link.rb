require_relative './post'

class Link < Post
  
  key :url,              String
  key :description,      String
  key :description_html, String
  
  attr_accessible :url, :description
  
  validates_presence_of :url, :description
  
  before_save :format_description
  
  protected
  
  def format_description
    self.description_html = markdown_to_html(description).strip
  end
  
end