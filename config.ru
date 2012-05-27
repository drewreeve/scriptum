require './init'

app = Rack::Builder.new do
  
  map "/" do
    run Scriptum::BlogApp
  end
  
  map '/sessions' do
    run Scriptum::UserSessionApp
  end
  
  map "/admin" do
    run Scriptum::AdminApp
  end
  
  map "/admin/posts" do
    run Scriptum::ManagePostsApp
  end
  
  map "/admin/users" do
    run Scriptum::ManageUsersApp
  end
end

run app
