require 'rake'
require 'rake/testtask'
require 'rbconfig'
include Config

desc 'Install the memoize library (non-gem)'
task :install do
   sitelibdir = CONFIG['sitelibdir']
   file = 'lib/memoize.rb'
   FileUtils.cp(file, sitelibdir, :verbose => true)
end

desc 'Install the memoize library as a gem'
task :install_gem do
   ruby 'memoize.gemspec'
   file = Dir['*.gem'].first
   sh 'gem install #{file}'
end

desc 'Run the fibonacci example & benchmarks'
task :example_fib do
   ruby '-Ilib examples/example_fibonacci.rb'
end

desc 'Run the memoize example & benchmarks'
task :example_memoize do
   ruby '-Ilib examples/example_memoize.rb'
end

Rake::TestTask.new do |t|
   t.libs << 'test'
   t.verbose = true
   t.warning = true
end
