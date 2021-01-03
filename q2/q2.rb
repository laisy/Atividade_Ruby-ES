#[1, [2, 3], 4, [[5, 6], 7]].each_with_flattening { |s| print "#{s}," }
#>> 1, 2, 3, 4, 5, 6, 7

class Array
def each_with_flattening
  self.each do |item|
    if item.class == Array
      item.each_with_flattening { |s| yield s }
    else
      yield item
    end
  end
end
end

File.open('entradaq2.txt', 'r').each_line do |line|
    entrada = eval(line)
    entrada.each_with_flattening{ |s|
print"#{s}," }
    print "\n"
end
