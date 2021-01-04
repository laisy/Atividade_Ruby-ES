class BST
  attr_reader :val
  attr_accessor :esq, :dir

  def initialize(val=nil)
    @val = val
    @esq = nil
    @dir = nil
  end

  def empty?
    @val == nil
  end
    def << (val)
        if self.empty?
        @val=val
        else
            if @val > val
                if @esq == nil
                    @esq = BST.new(val)
                else
                    @esq.<<(val)
                end

            else
                if @dir == nil
                    @dir = BST.new(val)
                else
                    @dir.<<(val)
                end
            end
        end
    end

  def each
    unless self.empty?
      @esq.each { |val| yield(val) } unless @esq.nil?
      yield @val
      @dir.each { |val| yield(val) } unless @dir.nil?
    end
  end
end

a = BST.new
p a.empty?

File.open('entradaq3.txt', 'r').each_line do |line|
    line.slice! "\n"
    a.<<(eval(line))
end

p a.empty?

a.each{|(a)| puts (a)}
