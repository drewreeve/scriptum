require 'securerandom'

class User
  include MongoMapper::Document
  
  key :username, String
  key :encrypted_password, String
  
  many :posts

  attr_accessor :password
  attr_accessible :username, :password, :password_confirmation
  
  validates :username, :presence => true, :uniqueness => true
  validates_presence_of     :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of       :password, :within => 6..32, :allow_blank => true
  
  before_save :encrypt_password
  before_destroy :check_if_last_user
  after_destroy  :destroy_posts
  
  def self.authenticate(username, password)
    user = User.first(:conditions => {:username => username})
    if user && BCrypt::Password.new(user.encrypted_password) == password
      user
    else
      nil
    end
  end
  
  protected
  
  def encrypt_password
    if password.present?
      self.encrypted_password = BCrypt::Password.create(password)
    end
  end
  
  def password_required?
    !persisted? || !password.blank? || !password_confirmation.blank?
  end
  
  def check_if_last_user
    if User.count == 1
      errors.add(:base, "Must be at least one user present")
      return false
    end
  end

  def destroy_posts
    posts.each { |post| post.destroy }
  end
end
