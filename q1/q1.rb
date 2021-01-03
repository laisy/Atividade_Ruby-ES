class Class
    def attr_accessor_with_history(name)
        name = name.to_s        #transformar em string
        attr_reader name
        attr_reader name+"_history"

        #classe que define metodos de instância
        class_eval %Q"
            def #{name}=(value)
                if !defined? @#{name}_history
                    @#{name}_history = [@#{name}]
                end
                @#{name} = value
                @#{name}_history << value

                if @#{name}_history.first == nil
                    @#{name}_history.shift

                end
            end
            def history (name)
                print @#{name}_history
            end
        "
    end
end

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new         # => #<Foo:0x127e678>

File.open('entradaq1.txt', 'r').each_line do |line|
    line.slice! "\n"
    f.bar = eval(line)
end

f.history(:bar)     # => [3, :wowzo, 'boo!']
