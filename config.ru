require './init'

app = Rack::Builder.new do
  
  map "/" do
    run Scriptum::Blog
  end
  
  map "/admin" do
    run Scriptum::Admin
  end
  
end

run app