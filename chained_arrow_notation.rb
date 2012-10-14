
def arrow(base, exponent, arrows)
  result = nil
  if arrows == 1
    result = 1
    (1..exponent).each do |n|
      result *= base
    end
  else
    temp_exponent = base
    (1..(exponent - 1)).each do
      result = arrow(base, temp_exponent, arrows - 1)
      temp_exponent = result
    end
  end
  result
end

def chained_arrow(chains)
  if chains[-2].kind_of?(Integer) and chains[-2] == 1
    chains.pop(2)
  elsif chains[-1].kind_of?(Integer) and chains[-1] == 1
    chains.pop
  end

  is_all_of_integers = true
  chains.each do |item|
    is_all_of_integers = false if not item.kind_of?(Integer)
  end
  if chains.size <= 3 and is_all_of_integers
    arrow(chains[0], chains[1], chains[2].nil? ? 1 : chains[2])
  else
    y = chains.dup
    y[-2] -= 1
    chains[-2] = chained_arrow(y)
    chains[-1] -= 1
    chained_arrow(chains)
  end
end

chains = [2, 2, 2, 2]

result = chained_arrow(chains)
puts "#{result}"

