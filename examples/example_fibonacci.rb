###################################################################
# fibonacci.rb
#
# Demonstrates, via Benchmark, the difference between a memoized
# version of the fibonnaci method versus a non-memoized version.
#
# You can run this via the 'example_fib' rake task.
###################################################################
require 'benchmark'
require 'memoize'
include Memoize

# Our fibonacci function
def fib(n)
   return n if n < 2
   fib(n-1) + fib(n-2)
end

file = File.join((ENV['HOME'] || ENV['USERPROFILE']), 'fib.cache')

max_iter = ARGV[0].to_i
max_fib  = ARGV[1].to_i

max_iter = 100 if max_iter == 0
max_fib  = 25 if max_fib == 0

print "\nBenchmarking against version: " + MEMOIZE_VERSION + "\n\n"

Benchmark.bm(35) do |x|
   x.report("Not memoized:"){
      max_iter.times{ fib(max_fib) }
   }

   x.report("Memoized:"){
      memoize(:fib)
      max_iter.times{ fib(max_fib) }
   }
   
   x.report("Memoized to file:"){
      memoize(:fib, file)
      max_iter.times{ fib(max_fib) }
   }
end

File.delete(file) if File.exists?(file)
