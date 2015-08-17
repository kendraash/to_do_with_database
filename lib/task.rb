class Task

    attr_reader(:description)

    define_method(:==) do |another_task|
            self.description().==(another_task.description())
    end
end
