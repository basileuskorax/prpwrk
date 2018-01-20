# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
# def word_lengths(string)
#
# end

# def word_lengths(string)
#   hash = {}
#   string.split.each {|word| hash[word] = word.length }
#   hash
# end

def word_lengths(string)
  result = Hash.new
  string.split.each {|k| result[k] = k.length}
  result
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.

# def greatest_key_by_val(hash)
#   hash.sort_by {|k, v| v}.last.first
# end

def greatest_key_by_val(hash)
  hash.sort_by {|k, v|v}.last.first
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each {|key, value| older[key] = value}
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  count = Hash.new(0)
  word.each_char {|char| count[char] += 1}
  count
end

def letter_counts(word)
  result = Hash.new
  word.each_char{|letter| result[letter] ? result[letter] += 1 : result[letter] = 1}
  result
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  mine_for_keys = {}
  arr.each {|el| mine_for_keys[el] = true}
  mine_for_keys.keys
end

def my_uniq(arr)
  arr_to_hash = Hash.new
  arr.each {|x| arr_to_hash[x] = true}
  arr_to_hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  count = {:even => 0, :odd => 0}

  numbers.each do |number|
    count[:even] += 1 if number.even?
    count[:odd] += 1 if number.odd?
  end

  count
end

def evens_and_odds(numbers)
  result = Hash.new
  result[:odd] = 0
  result[:even] = 0
  numbers.each {|num| num.odd? ? result[:odd] += 1 : result[:even] += 1}
  result
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowels = %w(a e i o u)
  counts = Hash.new(0) # Give the hash a default value of 0

  string.each_char {|character| counts[character] += 1 if vowels.include?(character)}

  counts.sort_by {|k, v| v}.last.first
end


# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students_with_birthdays)
  students = students_with_birthdays.select {|student, month| month >= 7}

  names = students.keys
  result = []

  names.each_index do |i|
    ((i + 1)...names.length).each do |j|
      result << [ names[i], names[j] ]
    end
  end

  result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  uniq_specimens = specimens.uniq
  species_count = {}

  uniq_specimens.each do |species|
    species_count[species] = specimens.count(species)
  end

  number_of_species = uniq_specimens.length
  smallest_species = species_count.values.min
  largest_species = species_count.values.max

  number_of_species ** 2 * smallest_species / largest_species
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_count = character_count(normal_sign)
  vandalized_count = character_count(vandalized_sign)

  vandalized_count.all? do |character, count|
    normal_count[character.downcase] >= count
  end
end

def character_count(str)
  count = Hash.new(0)

  str.each_char do |char|
    next if char == " "
    count[char.downcase] += 1
  end

  count
end

def character_count(str)
  
end
