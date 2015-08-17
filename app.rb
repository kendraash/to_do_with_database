require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("pg")

DB = PG.connect({:dbname => "to_do"})


get('/') do
    @lists = List.all()

    erb(:index)
end

get ('/list') do
    erb(:list)

end

post('/') do
    @id = params.fetch("id")
    @name = params.fetch("name")
    @list = List.new({:name => @name, :id => @id})
    @list.save()
    erb(:index)
end
