def measure(so_many =  1, &proc)
  start = Time.now
  so_many.times{proc.call}
  (Time.now - start)/so_many
end
