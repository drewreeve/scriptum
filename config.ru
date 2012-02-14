require './init'

app = Rack::Builder.new do
  
  map "/" do
    run Scriptum::BlogApp
  end
  
  map "/admin" do
    run Scriptum::AdminApp
  end
  
end

run app