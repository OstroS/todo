number = 3999

roman = ["M", "CM", "D", "CD", "C","XC", "L", "XL", "X", "IX", "V", "IV", "I"]
arabic = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

romanic = "";

(0..roman.size - 1).each do |i|
  while number >= arabic[i]
    romanic.concat roman[i]
    number = number - arabic[i]
  end
end

puts romanic

#!/usr/bin/env ruby
 
# Converts numbers from arabic to roman and the other way around
#
# Usage:
# t0.rb 4
# # prints: IV
# t0.rb IV
# # prints 4
# t0.rb
# # runs test suite
 
class String
  def valid_roman?
    
    # TODO: implement
  end
  
  def to_i_from_roman
    # TODO: implement
  end
end
 
class Integer
  def to_s_roman
    roman = ["M", "CM", "D", "CD", "C","XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    arabic = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    romanic = "";
    @number = self;
    (0..roman.size - 1).each do |i|
      while @number >= arabic[i]
	romanic.concat roman[i]
	@number = @number - arabic[i]
      end
    end
    romanic.to_s
  end
end
 
class RomanNumerals
  def initialize(args)
    @number = args.first
  end
  
  def convert!
   
    # TODO: implement
    exit(0) # Finish gracefully by default, change if appropriate
  end
end
 
# Make sure RomanNumbers#convert! ends the program with exit()
RomanNumerals.new(ARGV).convert! unless ARGV.empty?
 
require 'test/unit'
 
class StringTest < Test::Unit::TestCase
  def test_check_valid_roman
    assert "I".valid_roman?
    assert "IX".valid_roman?
    assert "VII".valid_roman?
    assert "IIII".valid_roman?
    assert "IV".valid_roman?
    assert "MCMXCIX".valid_roman?
    assert "MCCCIX".valid_roman?
    assert "MMXII".valid_roman?
  end
  
  def test_check_invalid_roman
    assert !"1234".valid_roman?
    assert !"aaaa".valid_roman?
    assert !"XXC".valid_roman?
    assert !"MCMXCIIX".valid_roman?
    assert !"IIIII".valid_roman?
  end
  
  def test_convert_valid_roman
    assert_equal 1, "I".to_i_from_roman
    assert_equal 9, "IX".to_i_from_roman
    assert_equal 7, "VII".to_i_from_roman
    assert_equal 4, "IIII".to_i_from_roman
    assert_equal 4, "IV".to_i_from_roman
    assert_equal 1999, "MCMXCIX".to_i_from_roman
    assert_equal 1309, "MCCCIX".to_i_from_roman
    assert_equal 2012, "MMXII".to_i_from_roman
  end
end
 
class IntegerTest < Test::Unit::TestCase
  def test_to_s_roman
    assert_equal "I", 1.to_s_roman
    assert_equal "IX", 9.to_s_roman
    assert_equal "VII", 7.to_s_roman
    assert_equal "IV", 4.to_s_roman
    assert_equal "MCMXCIX", 1999.to_s_roman
    assert_equal "MCCCIX", 1309.to_s_roman
    assert_equal "MMXII", 2012.to_s_roman
  end
end
 