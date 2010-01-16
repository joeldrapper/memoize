#################################################################
# test_memoize.rb
#
# Simple example to demonstrate the use of memoize and cache.
# You can run this via the 'rake example_memoize' task.
#################################################################
require "memoize"

puts "MEMOIZE VERSION: " + Memoize::MEMOIZE_VERSION

class Foo
   include Memoize
   def fib(n)
      return n if n < 2
      fib(n-1) + fib(n-2)
   end

   def factorial(n)
     f = 1
     n.downto(2) { |x| f *= x }
     return f
   end
end

if $0 == __FILE__
   a = Foo.new
   b = Foo.new
   c = Foo.new
   
   file = ENV["HOME"] || ENV["USERPROFILE"] + "/fib.cache"
   
   cache1 = b.memoize(:fib)
   cache2 = b.memoize(:factorial)
   cache3 = c.memoize(:fib, file)

   p cache1
   b.fib(3)
   p cache1

   p cache2
   b.factorial(3)
   p cache2

   p cache1
   
   print "\nWithout memoization\n\n"
   puts "Start: " + Time.now.to_s
   a.fib(32)
   puts "Stop: " + Time.now.to_s 

   print "\n\nWith memoization\n\n"
   puts "Start: " + Time.now.to_s
   b.fib(32)
   puts "Stop: " + Time.now.to_s

   print "\n\nWith memoization to file\n\n"
   puts "Start: " + Time.now.to_s
   c.fib(32)
   puts "Stop: " + Time.now.to_s
   
   File.delete(file) if File.exists?(file)
end
