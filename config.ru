require './init'

app = Rack::Builder.new do
  
  map "/" do
    run Scriptum::Blog
  end
  
end

run app