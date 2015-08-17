require('rspec')
require('pg')
require('task')

DB = PG.connect({:dbname => "to_do_test"})

RSpec.configure do |config|
    config.after(:each) do
        DB.exec("DELETE FROM tasks *;")
    end
end


describe(Task) do
    describe('#==') do
        task1 = Task.new({:description => "learning SQL"})
        task2 = Task.new({:description => "learning SQL"})
        expect(task1).to(eq(task2))
    end
end
