# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.each_char {|x| str.delete!(x) if x == x.downcase}
  str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  mid = str.length / 2
  str.length.odd? ? str[mid] : str[mid-1..mid]
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  count = 0
  str.each_char {|x| count += 1 if VOWELS.include?(x.downcase)}
  count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = 1
  (1..num).each {|n| product *= n}
  product
end

# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  result = ''
  arr.each do |x|
    result << x.to_s
    result << separator unless x == arr[-1]
  end
  result
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  result = ''
  arr_str = str.chars
  arr_str.each_index{|x| x.odd? ? result << arr_str[x].upcase : result << arr_str[x].downcase }
  result
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  final = []
  str.split.each do |x|
    x.reverse! if x.length > 4
    final << x
  end

  final.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  arr = []
  (1..n).each do |i|
    case
      when (i % 3 == 0) && (i % 5 == 0) then arr << "fizzbuzz"
      when i % 3 == 0 then arr << "fizz"
      when i % 5 == 0 then arr << "buzz"
      else arr << i
    end
  end
  arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  new_arr = []
  arr.each {|i| new_arr.unshift(i) }
  new_arr
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
# def prime?(num)
#   return false if num == 1
#   (2...num).each{|i| return false if (num % i) == 0}
#   return true
# end

def prime?(num)
  return false if num <= 1
  (2...num).none? {|n| num % n == 0}
end

# Write a method that returns a sorted array of the factors of its argument.
# def factors(num)
#   factors = []
#   (1..num).each{|i| factors << i if (num % i) == 0}
#   factors
# end

def factors(num)
  result = []
  (1..num).each {|i| result << i if num % i == 0}
  result
end

# Write a method that returns a sorted array of the prime factors of its argument.
# def prime_factors(num)
#   arr = factors(num)
#   new_arr = []
#   arr.each{|i| new_arr << i if prime?(i)}
#   new_arr.sort
# end

def prime_factors(num)
  factors = factors(num)
  factors.select {|i| prime?(i)}
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).count
end

# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
# def oddball(arr)
#   odd = []
#   even = []
#   arr.each{|x| x.even? ? even << x : odd << x }
#   return odd.length < even.length ? odd[0] : even[0]
# end

def oddball(arr)
  odd = []
  even = []
  arr.map {|e| e.odd? ? odd << e : even << e}
  odd.count == 1 ? odd[0] : even[0]
end
