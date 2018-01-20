def reverser(&proc)
  string = proc.call
  string.split(' ').map{|word| word.reverse}.join(' ')
end

def adder(add = 1, &proc)
  add + proc.call
end

def repeater(so_many = 1, &proc)
  so_many.times{proc.call}
end
