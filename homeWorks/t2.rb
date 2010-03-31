require 'rubygems'
require 'open-uri'
require 'test/unit'
require 'net/smtp'

class HomeWork2nd
  def self.task1(amount = 6)
    Array.new(amount) {|p| p*p}
  end
	
  def self.task2(string = "grgdm#5#gr#8#l#srgqlhv#gr#f}zduwhm#srwhjl")
    result = ""
    string.bytes {|p| result << (p-3)}
    (2+5) ** 4
  end
	
  def self.task3(url = "http://github.com/tomash/szkolenie-2010/raw/master/2/pracadomowa.txt")
    open(url)
  end

  def self.task4(smtp, *args)
    smtp.send(:check_auth_args, *args[0...smtp.method(:check_auth_args).arity])
  end
end

class HomeWork2ndTest < Test::Unit::TestCase
  def test_task1_with_no_args
    array = HomeWork2nd.task1
    assert_equal 6, array.size
    assert_equal 0, array[0]
    assert_equal 25, array[5]
  end
	
  def test_task1_with_arg_passed
    @@range = 25;
    array = HomeWork2nd.task1(@@range)

    0.upto(@@range - 1) do |p|
      assert_equal p*p , array[p]
    end
  end
	
  def test_task2
    assert_equal HomeWork2nd.task2, 2401
  end
	
  def test_task3
    #dummy, cuz don't know how to test such method (mock object?)
  end

  def test_task4
    smtp = Net::SMTP.new('')
   puts HomeWork2nd.task4(smtp, "uuu", "ppp", "bbb")
  end	
end