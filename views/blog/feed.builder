xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.id "http://#{request.host_with_port}/"
  xml.title "#{@settings.site_name}: Recent Posts"
  xml.link :href => "http://#{request.host_with_port}/"
  xml.updated @posts.first.created_at.iso8601

  @posts.each do |post|
    xml.entry do
      xml.title post.title
      xml.published post.created_at.iso8601
      xml.id [request.host_with_port, post.id.to_s].join(':')
      xml.link :href => "http://#{request.host_with_port}/posts/#{post.slug}"
      xml.updated post.updated_at.iso8601
      xml.author do
        xml.name post.user.username
      end
    end
  end
end
