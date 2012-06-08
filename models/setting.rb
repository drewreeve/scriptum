
class Setting
  include MongoMapper::Document

  key :site_name, String, :default => "New Tumblelog"
  key :admin_record_limit, Integer, :default => 15
  key :homepage_records, Integer, :default => 10
  key :feed_records, Integer, :default => 10

  attr_accessible :site_name, :admin_record_limit, :homepage_records, :feed_records

  validates_presence_of :site_name

  before_create :check_for_existing_record

  def check_for_existing_record
    false if Setting.count > 0
  end
end
